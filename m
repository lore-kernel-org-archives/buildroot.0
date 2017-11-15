From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Nov 2017 23:29:30 +0100
Subject: [Buildroot] [PATCH] dropbear: change start-up script to honour
 pre-existing keys
In-Reply-To: <CAGt4E5uZzBjfTqQh9RAN+wek9B+31PgWn3XJwSrDYz-sg6yFCA@mail.gmail.com>
References: <20171115194509.78132-1-code@mmayer.net>
 <74751d46-877e-ef18-ce79-0e7c6f46e5d9@mind.be>
 <CAGt4E5uZzBjfTqQh9RAN+wek9B+31PgWn3XJwSrDYz-sg6yFCA@mail.gmail.com>
Message-ID: <a34d3f69-8595-0d2b-1728-c0fdcfe676ad@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-11-17 22:24, Markus Mayer wrote:
> On 15 November 2017 at 13:18, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>> On 15-11-17 20:45, Markus Mayer wrote:
>>> From: Markus Mayer <mmayer@broadcom.com>
>>>
>>> Rather than starting dropbear with option -R at all times, we only do
>>> so if no existing key file is found. This lets dropbear honour
>>> pre-existing key files, including keys copied into the root file system
>>> at build time.
>>
>>  That's exactly what the -R option does, no? It creates host keys if they don't
>> exist yet. Cfr. svr_ensure_hostkey in svr-kex.c.
> 
> That's what I expected, too, but it doesn't work that way for me.
> 
> I am not entirely sure why. I do see dropbear using a different SSH
> key every time the system is booted, even if a key file already exists
> whenever it is started using -R. It is trying to use ECDSA keys. The
> pre-generated key I am copying into the rootfs is an RSA key. I am
> running with initrd, so the ECDSA key disappears upon reboot. Fact
> remains that it is ignoring the existing RSA key.
> 
> Here's an example of what I see:
> 
> # ssh localhost
> Host 'localhost' is not in the trusted hosts file.
> (ssh-rsa fingerprint md5 3c:62:78:a7:4a:4e:c5:69:cb:57:06:c6:b1:20:2e:9a)
> Do you want to continue connecting? (y/n) ^C
> 
> Using the RSA key, as it is supposed to. But only because it was
> started without -R.
> 
> # ps aux|grep drop
>  1471 root     /usr/sbin/dropbear
>  1506 root     grep drop
> 
> Re-starting with -R.
> 
> # kill 1471
> # /usr/sbin/dropbear -R
> 
> And trying it again.
> 
> # ssh localhost
> Host 'localhost' is not in the trusted hosts file.
> (ecdsa-sha2-nistp521 fingerprint md5
> f4:c8:5a:37:ac:20:80:96:9f:2b:72:1b:ee:7d:c1:1e)
> Do you want to continue connecting? (y/n) ^C
> 
> Promptly using an ECDSA key now. Freshly generated.

 OK, I see what happens.

 Your ssh client is requesting an ECDSA key. So when dropbear is given the -R
option and the ECDSA key doesn't exist, it will generate one. If -R is not
given, it will not generate a key and it will just fail. Then the client will
fall back to requesting an RSA key, and this is one that can be supplied.


 I still don't think that your solution in the init script is very elegant. I
think it's rather exceptional that you want only an RSA host key in your rootfs
and not an ECDSA and/or DSS key. If you really want that, you can put a custom
init script in your fs overlay that removes -R completely. Or you can add a
DROPBEAR_POST_EXTRACT_HOOK in your local.mk that removes DROPBEAR_ECDSA from
options.h.

 Regards,
 Arnout

-

> 
> # date
> Thu Jan  1 00:03:12 UTC 1970
> 
> # ls -l /etc/dropbear/
> total 8
> -rw-------    1 root     root           243 Jan  1 00:01 dropbear_ecdsa_host_key
> -rw-------    1 root     root          1573 Nov  1  2017 dropbear_rsa_host_key
> 
> dropbear_ecdsa_host_key is does not exist in the initrd.
> dropbear_rsa_host_key does.
> 
> Regards,
> -Markus
> 
>>  Regards,
>>  Arnout
>>
>>>
>>> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
>>> ---
>>>  package/dropbear/S50dropbear | 11 +++++++++--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
>>> index 9474eaa..8eea9ae 100644
>>> --- a/package/dropbear/S50dropbear
>>> +++ b/package/dropbear/S50dropbear
>>> @@ -7,7 +7,7 @@
>>>  test -r /etc/default/dropbear && . /etc/default/dropbear
>>>
>>>  start() {
>>> -     DROPBEAR_ARGS="$DROPBEAR_ARGS -R"
>>> +     msg=' '
>>>
>>>       # If /etc/dropbear is a symlink to /var/run/dropbear, and
>>>       #   - the filesystem is RO (i.e. we can not rm the symlink),
>>> @@ -26,7 +26,14 @@ start() {
>>>               fi
>>>       fi
>>>
>>> -     printf "Starting dropbear sshd: "
>>> +     ls /etc/dropbear/*host_key >/dev/null 2>&1
>>> +     if [ $? != 0 ]; then
>>> +             # No key files found. We need to generate a key.
>>> +             DROPBEAR_ARGS="$DROPBEAR_ARGS -R"
>>> +             msg='(with new key) '
>>> +     fi
>>> +
>>> +     printf "Starting dropbear sshd: $msg"
>>>       umask 077
>>>
>>>       start-stop-daemon -S -q -p /var/run/dropbear.pid \
>>>
>>
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

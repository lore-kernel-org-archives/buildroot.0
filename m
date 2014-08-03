From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 3 Aug 2014 09:25:13 -0400
Subject: [Buildroot] [PATCH 1/1] openssh: replace individual ssh-keygen
 calls with a single call
In-Reply-To: <20140803073726.GB4052@free.fr>
References: <1407028879-2004-1-git-send-email-danomimanchego123@gmail.com>
 <20140803073726.GB4052@free.fr>
Message-ID: <CANxTyt70cnBy56QgMjGSMc092fEx9O-yWwegcL6S2kRtR0dSzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Aug 3, 2014 at 3:37 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Danomi, All,
>
> On 2014-08-02 21:21 -0400, Danomi Manchego spake thusly:
>> Since openssh-6.0, the ssh-keygen app has supported a -A option,
>> which creates any missing keys.  This frees us of having to add
>> new ssh-keygen invocations as new key types are introduced.  This
>> also frees us of having to know the default key names and locations.
>> So this patch replaces all the the init.d script invocations with
>> a single "ssh-keygen -A" call.
>>
>> Note: the systemd service script *already* uses this option.
>>
>> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> However, I have a comment about this key generation: it does not work
> when the filesystem is read-only. That was already the case before your
> patch, hence my Ack. But we should probably find a way to fix that one
> way or the other.
>
> One option would be to pre-generate the host keys at build-time. There
> are pros abd cons with this, though:
>
>   - pros: we can save the public keys and store them in the known_hosts
>     file of the user. No confirmation at first connection, usefull
>     during development;
>
>   - cons: the image can't be realisticaly deployed to many targets,
>     otherwise they would all have the same keys. Bad.
>
> I don't have a better solution for now... :-/
>
> Of course, we can also delegate to the user the reponsibility to ensure
> that /etc *is* writable when openssh is installed (which we implicitly
> do right now.)

I think this issue is not limited to openssh - there's other things
that want to occasionally save stuff to /etc, /var, even /root (e.g.
gstreamer plugins cache).  I suppose that efforts could be made to try
to patch/configure these locations to all be in one place (/var ?),
but that still assumes a writable directory.  So, unless we direct all
attempts to save state to a tmpfs, I think it always come back to
being the user's responsibility.

So for now I'm content to keep openssh as it is, rather than hunt down
all the places that might try to write to etc (, var, $HOME, ...).

Danomi -


> Regards,
> Yann E. MORIN.
>
>> ---
>>  package/openssh/S50sshd |   34 ++--------------------------------
>>  1 file changed, 2 insertions(+), 32 deletions(-)
>>
>> diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
>> index d3abf7c..65bdb90 100644
>> --- a/package/openssh/S50sshd
>> +++ b/package/openssh/S50sshd
>> @@ -6,38 +6,8 @@
>>  # Make sure the ssh-keygen progam exists
>>  [ -f /usr/bin/ssh-keygen ] || exit 0
>>
>> -# Check for the SSH1 RSA key
>> -if [ ! -f /etc/ssh_host_key ] ; then
>> -     echo Generating RSA Key...
>> -     /usr/bin/ssh-keygen -t rsa1 -f /etc/ssh_host_key -C '' -N ''
>> -fi
>> -
>> -# Check for the SSH2 RSA key
>> -if [ ! -f /etc/ssh_host_rsa_key ] ; then
>> -     echo Generating RSA Key...
>> -     /usr/bin/ssh-keygen -t rsa -f /etc/ssh_host_rsa_key -C '' -N ''
>> -fi
>> -
>> -# Check for the SSH2 DSA key
>> -if [ ! -f /etc/ssh_host_dsa_key ] ; then
>> -     echo Generating DSA Key...
>> -     echo
>> -     /usr/bin/ssh-keygen -t dsa -f /etc/ssh_host_dsa_key -C '' -N ''
>> -fi
>> -
>> -# Check for the SSH2 ECDSA key
>> -if [ ! -f /etc/ssh_host_ecdsa_key ]; then
>> -     echo Generating ECDSA Key...
>> -     echo
>> -     /usr/bin/ssh-keygen -t ecdsa -f /etc/ssh_host_ecdsa_key -C '' -N ''
>> -fi
>> -
>> -# Check for the ed25519 key
>> -if [ ! -f /etc/ssh_host_ed25519_key ]; then
>> -     echo Generating ed25519 Key...
>> -     echo
>> -     /usr/bin/ssh-keygen -t ed25519 -f /etc/ssh_host_ed25519_key -C '' -N ''
>> -fi
>> +# Create any missing keys
>> +/usr/bin/ssh-keygen -A
>>
>>  umask 077
>>
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

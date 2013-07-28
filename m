From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 28 Jul 2013 10:40:15 +0200
Subject: [Buildroot] [PATCH] system: only set the root password if it's
 not empty
In-Reply-To: <20130703044618.GA4406@berrier.lan>
References: <20130702085224.GA25620@berrier.lan>
 <20130702173111.GA3221@free.fr> <20130703044618.GA4406@berrier.lan>
Message-ID: <CAAXf6LVNOFmX9HXAMEJH=mbRkgmhfAxqqiL8e+Qkrsw_jxU9Eg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Jul 3, 2013 at 6:46 AM, Wade Berrier <wberrier@gmail.com> wrote:
> Hello,
>
> On Jul 02 19:31, Yann E. MORIN wrote:
>> Wade, All,
>>
>> On 2013-07-02 02:52 -0600, Wade Berrier spake thusly:
>> > No need to replace the password in etc/shadow with a blank password.
>>
>> How do you differentiate between those two cases:
>>   - use an empty password,
>>   - do not change the existing password?
>>
>> My opinion is that we do want to be able to set an empty pasword,
>> especially in the case of a custom skeleton. This makes it systematic,
>> so the user knows what to expect.
>
> If that's desired, then yes, my patch isn't a good solution.
>
>>
>> If you want to not use the config option to handle the root password,
>> then you can use either:
>>   - a post-build script, or
>>   - a skeleton overlay.
>>
>> (If I read the Makefiles correctly, skeleton overlays are handled during
>> target-finalize, which is called after target-root-passwd, so the
>> overlay should take precedence over the root password option. To be
>> confirmed...)
>
> I guess one real issue is that mkpasswd on redhat fails and returns an empty
> hash, which is inserted into the shadow file.
>
> Maybe the thing to do to work across distros would be to compile the correct
> mkpasswd as a host- package?

Recently, another mkpasswd related problem popped up: seems that on
(some?) Slackware boxes, mkpasswd does not support -m <method>, and
buildroot fails. See
http://lists.busybox.net/pipermail/buildroot/2013-July/075771.html.
Making sure we always use the same mkpasswd would help in both cases.

Should we create a separate host-mkpasswd package based on the whois
sources? (https://github.com/rfc1036/whois)
Or should we add the whois package, and depend on that?
To me, the former seems more appropriate...

Best regards,
Thomas

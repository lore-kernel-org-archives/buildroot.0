From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 26 Jul 2013 12:25:33 +0200
Subject: [Buildroot] Strange error when set root password in buildroot
In-Reply-To: <20130726093118.GA16261@zuhnb712.ap.bm.net>
References: <20130725024203.GC391@zuhnb712.ap.bm.net>
 <CAAXf6LU==DtcLaPEiXopt6+32KH=0c4Ws7S7hjw=A183aNjP3w@mail.gmail.com>
 <20130726093118.GA16261@zuhnb712.ap.bm.net>
Message-ID: <CAAXf6LXcgSMJ1v6nzVMOG=DfkWmJz8SaZm+Rzti4ENBXABKoqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 26, 2013 at 11:31 AM, Woody Wu <narkewoody@gmail.com> wrote:
> On Thu, Jul 25, 2013 at 10:25:38AM +0200, Thomas De Schampheleire wrote:
>> Hi,
>>
>> On Thu, Jul 25, 2013 at 4:42 AM, Woody Wu <narkewoody@gmail.com> wrote:
>> > Hi,
>> >
>> > Today I just set the root password in buildroot. Then I got strange
>> > error when building:
>> >
>> > /usr/bin/sed -i -e 's,^root:[^:]*:,root:usage: mkpasswd [args] [user]   where arguments are:     -l #      (length of password, default = 9)     -d #      (min # of digits, default = 2)     -c #      (min # of lowercase chars, default = 2)     -C #      (min # of uppercase chars, default = 2)     -s #      (min # of special chars, default = 1)     -v        (verbose, show passwd interaction)     -p prog   (program to set password, default = passwd):,' /home/woody/src/buildroot-2013.05/output/target/etc/shadow
>> > /usr/bin/sed: -e expression #1, char 109: unknown option to `s'
>> > make: *** [target-root-passwd] Error 1
>> >
>> > What's the problem? Thanks.
>>
>> It seems that the mkpasswd on your system is not the same type as
>> buildroot expects.
>> Buildroot runs mkpasswd with '-m <method>', which does not seem to be
>> present on your mkpasswd.
>>
>> What Linux system is this?
>> What is the output of:
>> which mkpasswd
>> and
>> mkpasswd -V
>>
>> (I think the latter will not work in your case anyway, in my case it's:
>>
>> $ mkpasswd -V
>> mkpasswd 5.0.19
>>
>
> sorry, now I understand what you mean.  My linux is slackware linux, the
> mkpasswd located in /usr/bin/mkpasswd, which even don't support -V or
> --version to check its version number. And, yes, you are right, my
> 'mkpasswd' does not recognize '-m' option.

I'm not sure. Either we have to change buildroot to detect whether -m
is available before using it (if not, it will probably default to
md5). Or we need to find another solution.

Just a wild guess, can you check if there are other mkpasswd's available?
ls -l /bin/mkpasswd /usr/bin/mkpasswd /sbin/mkpasswd /usr/sbin/mkpasswd

A workaround for you is to change buildroot to remove the -m thing,
but it's better if we fix it completely, I think.

Thanks,
Thomas

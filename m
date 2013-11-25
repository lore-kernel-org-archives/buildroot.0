From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 25 Nov 2013 16:51:09 +0100
Subject: [Buildroot] [PATCH] lvm2: replace
	!BR2_PACKAGE_LVM2_DMSETUP_ONLY by BR2_PACKAGE_LVM2_FULL_SUITE
In-Reply-To: <52936E30.1000208@mind.be>
References: <20131123183721.071bcfa1@skate>
 <1385250624-15984-1-git-send-email-arnout@mind.be>
 <CAAXf6LXHZw6YRg1P+2=B1wca0CWHFhxocnYoQ4W7JmOb_v=Twg@mail.gmail.com>
 <52932E3A.2080903@mind.be>
 <CAAXf6LU5OkxP8VyPZ4XK0Fp6KAAn6N+8OhiQnXnv4f-=4Lk3AA@mail.gmail.com>
 <52936E30.1000208@mind.be>
Message-ID: <CAAXf6LX5cCNUFy-=v27dv=N+i5yoDv8smmztF6+PupXAv0_U7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 25, 2013 at 4:35 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 25/11/13 16:10, Thomas De Schampheleire wrote:
[..]
>>
>>
>> How 'large' is this application library? In this particular
>> configuration it is 810K (liblvm2app.so). Is it acceptable to include
>> it always in the 'full suite' (and thus remove the option
>> BR2_PACKAGE_LVM2_APP_LIBRARY)?
>
>
>  To help answer that question, on my x86_64 glibc build:
>
> 3.0M    /tmp/lvm2-app-library
> 2.1M    /tmp/lvm2-full-suite
> 472K    /tmp/lvm2-minimal
>
>
>  So the app library adds another 40% to the package size. I guess that's
> significant enough not to remove the existing option. Especially because the
> only reason is that we can't find a better name for it :-)
>
>  My original name was "install all binaries", but I found that less
> descriptive than "full suite". Maybe "install all LVM2 programs"?

It's more than just programs, right? The default SUBDIRS includes some
libraries too:
SUBDIRS = conf daemons include lib libdaemon libdm man scripts tools

Maybe we should add 'default' in the name somewhere, as what it
installed is the set of programs/libraries/headers that are installed
by default by 'make install'. The APPLIB option then additionally
passes an extra request to configure. So for example:
BR2_PACKAGE_LVM2_DEFAULT_INSTALL
BR2_PACKAGE_LVM2_DEFAULT_SUITE
BR2_PACKAGE_LVM2_NOT_ONLY_DEVICEMAPPER ;-)
...

>
>  I could also copy the full list (which is in the .mk file) to the help
> text.

That list is only used for the uninstall, so are we sure that it is up-to-date?


Best regards,
Thomas

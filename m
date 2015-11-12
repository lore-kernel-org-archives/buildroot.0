From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Nov 2015 09:19:41 +0100
Subject: [Buildroot] [PATCH v2 1/1] qemu: add patch to fix SSP support
 detection
In-Reply-To: <CABLs7GXMFP-vm1tRx1zcQZAsJ+KXUV8JNqxLN+3qPhGbNDL50w@mail.gmail.com>
References: <1447280301-9225-1-git-send-email-rprebello@gmail.com>
 <5643CF83.6000800@mind.be>
 <CABLs7GXMFP-vm1tRx1zcQZAsJ+KXUV8JNqxLN+3qPhGbNDL50w@mail.gmail.com>
Message-ID: <56444B9D.3060501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-11-15 00:49, Rodrigo Rebello wrote:
> Arnout,
> 
> 2015-11-11 21:30 GMT-02:00 Arnout Vandecappelle <arnout@mind.be>:
>> On 11-11-15 23:18, Rodrigo Rebello wrote:
[snip]
>>> +diff --git a/configure b/configure
>>> +index cd219d8..a6f4101 100755
>>> +--- a/configure
>>> ++++ b/configure
>>> +@@ -1471,6 +1471,24 @@ for flag in $gcc_flags; do
>>> + done
>>> +
>>> + if test "$stack_protector" != "no"; then
>>> ++  cat > $TMPC << EOF
>>> ++void foo(const char *c);
>>
>>  This declaration is unnecessary.
>>
> 
> Actually it is necessary, otherwise compiling the test code fails with:
> 
> config-temp/qemu-conf.c:3:6: error: no previous prototype for ?foo?
> [-Werror=missing-prototypes]
>  void foo(const char *c)
>       ^
> 
> Because in configure, line 410, -Wmissing-prototypes is added to
> QEMU_FLAGS (used in every compile test), and tests are run with
> -Werror by default, unless --disable-werror is passed to the configure
> script.

 Right. And I guess declaring it static means that the whole function could be
elided so still no stack protection.

 I wonder what would happen if LTO were enabled, since in that case the function
could be elided again...

 To solve this fundamentally in buildroot, perhaps we should patch the gcc
wrapper to fail when -fstack-protector-* is passed when SSP is not enabled.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

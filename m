From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat, 14 Mar 2015 17:15:03 +0100
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <54F8DD53.3060000@mind.be>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150303142901.5998a72c@free-electrons.com> <54F8DD53.3060000@mind.be>
Message-ID: <CAHkwnC9wQZj6YxexYEt2fuZaeK_GD-S_BTg45wTcr9ZiLyKeKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 5, 2015 at 11:48 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 03/03/15 14:29, Thomas Petazzoni wrote:
>> Dear Fabio Porcedda,
>>
>> On Tue,  3 Mar 2015 10:17:05 +0100, Fabio Porcedda wrote:
>>
>>> > this patch set aims to improve build reproducibility by using a
>>> > per-package staging directory.
>>> > Also this feature aims to enable as default the top-level parallel make.
>> Interesting! I must say I'm a bit worried about the implications of
>> having to pass custom -I and -L flags all the time: we did arrange the
>> compiler do not require those (by configuration for the internal
>> toolchain case, and using the wrapper for the external toolchain case).
>
>  I also like this feature very much!
>
>  However, I don't like at all the approach of passing the custom -I and -L
> flags. I think it's much better to start with something that was suggested
> before in the BR developer meeting: use the toolchain wrapper also for the
> internal toolchain. Then we can pass the per-package staging dir through the
> environment, and use it in the --sysroot argument of the compiler.
>
>  We'll also have to do something about ccache then - that could be a problem.
> Perhaps ccache should be called from within the wrapper as well, that may solve
> a bunch of other ccache problems.

Using an internal wrapper we can also pass pass the -I and -L
automatically like the --sysroot option?

If we use a per-package sysroot we need to copy the sysroot directory
too, because the size of a uclibc sysroot is at least 11MB (if i
remember correctly the size of a glibc sysroot is something like
40MB), so if we copy without using hard links, it will take at least
10MB up to 40MB for every package.

The size of the output directory of a defconfig + allyespackageconfig is 11GB.
IMHO we have the following choices:
a) common sysroot & per-package staging & without hard links
  - the -I -L options are passed trough the toolchain wrapper
  - output size is 16GB (11GB+5GB)
  - no side effects to fear, because hard links are not used
b) per-package sysroot & without hard links
  - sysroot are passed trough the toolchain wrapper
  - output size will be 16GB plus 11MB * 694 = 16GB + 7GB = 23 GB
  - no side effects to fear, because hard links are not used
c) per-package sysroot & with hard links for toolchain
 - sysroot are passed trough the toolchain wrapper
  - output size will be 16GB
  - side effects to fear for the toolchain files because hard links
are used for them
d) per-package sysroot & with hard links for all files
 - sysroot are passed trough the toolchain wrapper
  - output size will be 11GB, so no increased size
  - side effects to fear because hard links are used

The cheaper one with almost no size and speed penalization is d) but
if some file is overwritten other package sysroot could be affected.
Maybe we can prevent the overwriting by removing the write permission
on staging files?

Which solution is most suited for  buildroot?

Thanks and my BR
-- 
Fabio Porcedda

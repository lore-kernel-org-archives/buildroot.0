From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Nov 2015 00:46:51 +0100
Subject: [Buildroot] [PATCH v2] openssl: fix race condition when symlink
 shared libs
In-Reply-To: <CALq67GC8mvMfpwVLpaticcDxewr12Xxk7p3UUSQrEfmxB0ZWZg@mail.gmail.com>
References: <1448036610-7077-1-git-send-email-ryan.barnett@rockwellcollins.com>
 <CALq67GC8mvMfpwVLpaticcDxewr12Xxk7p3UUSQrEfmxB0ZWZg@mail.gmail.com>
Message-ID: <5651026B.2050805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-11-15 01:55, Ryan Barnett wrote:
> All,
> 
> On Fri, Nov 20, 2015 at 10:23 AM, Ryan Barnett
> <ryan.barnett@rockwellcollins.com> wrote:
>> The build-shared target depends on do_crypto and link-shared, which
>> will be executed in parallel. do_crypto calls
>> link_a.linux_shared -> link_a.gnu which does SYMLINK_SO; in parallel,
>> link-shared calls symlink.linux_shared which also does SYMLINK_SO.
>> Before the symlink is created, it is rm'ed, but there is a tiny chance
>> that the second one is created after the rm has been called.
>>
>> Fix this by using 'ln -sf' instead of 'ln -s' so the build doesn't
>> error out.
>>
>> Patch submitted upstream at:
>>   https://bugs.gentoo.org/show_bug.cgi?id=566260
> 
> So it doesn't appear that using 'ln -sf' is a valid fix as pointed out
> in the bug report on the gentoo forum:
> 
>  -- Comment #2 from SpanKY <vapier@gentoo.org> ---
>  `ln -sf` is no more atomic than `rm; ln`.  there is still a window where things
>  can fail.  you can easily check this:
> 
>    i=0; while [ $((i++)) -lt 500 ]; do ln -sf a b & :; done
> 
>  a good number of those will fail with:
>  ln: failed to create symbolic link ?b?: File exists
> 
>  the deps need to be fixed up
> 
> So how do we want to proceed with this? Do we revert the patch for
> parallel builds for openssl?

 I think for 2015.11 at least we should indeed revert it.

 The symlink can be created atomically by going through a temp file, but that's
a bit crazy...

 Regards,
 Arnout

> 
> Thanks,
> -Ryan
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

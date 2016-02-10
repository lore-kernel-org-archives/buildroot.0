From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 01:37:17 +0100
Subject: [Buildroot] [PATCH v2] linux: add conditional patch for
 timeconst.pl
In-Reply-To: <56BA73F2.7080009@free-electrons.com>
References: <1454852508-27544-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <56BA718A.5060500@mind.be> <56BA73F2.7080009@free-electrons.com>
Message-ID: <56BA863D.3030600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-02-16 00:19, Gustavo Zacarias wrote:
> On 09/02/16 20:08, Arnout Vandecappelle wrote:
> 
>>   and debian testing (stretch) and unstable (sid).
>>
>>   As Thomas said, it's dirty, but we really need this.
> 
> Hi Arnout.
> Yes, i couldn't figure out a cleaner way to do this, continues below...
> 
>>   The only reason to use APPLY_PATCHES is that it updates .applied_patches_list,
>> right? In that case, perhaps it's better to do that directly here. So instead of
>> a dry-run, just apply the patch right away, and if it succeeds add it to
>> .applied_patches_list.
> 
> I could have probed the timeconst.pl file presence and relevancy (if it contains
> defined(@array)...), but then a dry-run patch does that for me just fine with
> the proper parameters.

 My thoughts exactly.

> Yes, that's the reason for APPLY_PATCHES, however since it's already there why
> bother duplicating code?

 Well, you're already duplicating code because you first to patch and then
APPLY_PATCHES. My idea was something like:

	$(Q)cd $(@D); patch -p1 -f -s >/dev/null 2>&1 \
		< $(LINUX_PKGDIR)/0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional \
		&& echo 0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional >
.applied_patches_list

 But really it's equally hacky so it doesn't matter much. Actually, my version
is especially hacky because it relies on the fact that the patch has a single
hunk so it will always pass or fail atomically.

> Also thought of extending apply-patches.sh to add an option for try-do/discard,
> but i believe it's a double-edged sword and not worth it quite yet.

 I considered that as well, like making it handle *.conditional this way. But
since this is the only patch for the time being, it's a bit redundant...


 Bottom line: keep it as it is.

 Regards,
 Arnout

> 
>>   This is a patch that we probably _do_ want to apply even in case of
>> OVERRIDE_SRCDIR. So maybe add it to LINUX_PRE_CONFIGURE_HOOKS instead. Even
>> though that's even more of a hack (and conflicts with the out-of-tree build
>> support).
> 
> Possibly, let's hear other people thoughts on this.
> Regards.
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

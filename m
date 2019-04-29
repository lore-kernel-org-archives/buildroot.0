From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 29 Apr 2019 16:51:08 +0200
Subject: [Buildroot] Linux arch default cfgs and fragments
In-Reply-To: <CANQCQpaeXHvgzqScpPDbwHoOhU=f9_5kn-hMPra+aC8A5YVr-Q@mail.gmail.com>
References: <CANQCQpZ3fyxSBbvkPURYj9LSYUKe7H9av+qvEwA3jvRFRrphaQ@mail.gmail.com>
 <4d2a6967-1451-7ed3-5465-05ca0d718019@mind.be>
 <CANQCQpaeXHvgzqScpPDbwHoOhU=f9_5kn-hMPra+aC8A5YVr-Q@mail.gmail.com>
Message-ID: <8ac9f99f-a388-13da-413a-9b7b6c1f6094@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/04/2019 16:39, Matthew Weber wrote:
[snip]
> I was just curious if we can make the use of fragments a bit more
> foolproof as options get dropped and you have to watch the warnings to
> catch when they do.

 OK, so your suggestion is to add a check that after fragments have been
applied, the resulting .config indeed contains the contents of the fragments.
Similar to the check we have in e.g. test-pkg for SKIPPED.

 The question is: do you want to make this an error or a warning? I think we
can't make it an error, because there are use cases where you expect the
fragment not to apply. I don't have a concrete example for the kernel config,
but for Buildroot configs I have some fragments that I sometimes use that set
defaults for some string options (e.g. for kernel defconfig to use), and that
only really apply to the defconfig in which the kernel is built, but that gets
applied everywhere (i.e. for all defconfigs for that particular board). So I'd
have four defconfigs for four different configurations which are independent of
the board, and then four config fragments for four different board types, with a
total of sixteen different .config files, but only four of those actually have a
kernel.

 Anyway, my point is: we can't really predict what the use case for config
fragments is, so we can't make it an error.

 And I do think it's already a warning. But of course, that warning gets
completely lost in the build log.

 In general, I think managing config fragments is far out of scope for
Buildroot. We might add some tools to make managing them easier (without
enforcing a particular workflow) but even that is a bit out of scope IMO. The
<pkg>-diff-config target from almost a year ago that is still floating around on
patchwork is already borderline IMO.

 Regards,
 Arnout

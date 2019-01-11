From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 11 Jan 2019 04:03:20 -0700
Subject: [Buildroot] [PATCH 1/1] package/systemd: add upstream fix for
 CVE-2018-16864
In-Reply-To: <87sgxzqxny.fsf@dell.be.48ers.dk>
References: <1547193242-29882-1-git-send-email-james.hilliard1@gmail.com>
 <87sgxzqxny.fsf@dell.be.48ers.dk>
Message-ID: <CADvTj4oX2kY5WepFYp7FY4UQJjUujpQ4+SeyWKiu4CvyFBMuWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 11, 2019 at 3:46 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "james" == james hilliard1 <james.hilliard1@gmail.com> writes:
>
>  > From: James Hilliard <james.hilliard1@gmail.com>
>  > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>  > ---
>  >  ...-not-store-the-iovec-entry-for-process-co.patch | 205 +++++++++++++++++++++
>  >  1 file changed, 205 insertions(+)
>  >  create mode 100644 package/systemd/0004-journald-do-not-store-the-iovec-entry-for-process-co.patch
>
>  > diff --git
>  > a/package/systemd/0004-journald-do-not-store-the-iovec-entry-for-process-co.patch
>  > b/package/systemd/0004-journald-do-not-store-the-iovec-entry-for-process-co.patch
>  > new file mode 100644
>  > index 0000000..dbf9bb5
>  > --- /dev/null
>  > +++ b/package/systemd/0004-journald-do-not-store-the-iovec-entry-for-process-co.patch
>  > @@ -0,0 +1,205 @@
>  > +From 084eeb865ca63887098e0945fb4e93c852b91b0f Mon Sep 17 00:00:00 2001
>  > +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
>  > +Date: Wed, 5 Dec 2018 18:38:39 +0100
>  > +Subject: [PATCH] journald: do not store the iovec entry for process
>  > + commandline on stack
>  > +
>  > +This fixes a crash where we would read the commandline, whose length is under
>  > +control of the sending program, and then crash when trying to create a stack
>  > +allocation for it.
>  > +
>  > +CVE-2018-16864
>  > +https://bugzilla.redhat.com/show_bug.cgi?id=1653855
>  > +
>  > +The message actually doesn't get written to disk, because
>  > +journal_file_append_entry() returns -E2BIG.
>  > +
>  > +[james.hilliard1 at gmail.com: backport from upstream commit
>  > +084eeb865ca63887098e0945fb4e93c852b91b0f]
>  > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> The "standard way" to backport is to use git cherry-pick -sx which adds
> a line like:
Patch format in buildroot seems to be fairly inconstant. I think this
format was what I was recommended to use last.
>
> (cherry picked from commit 084eeb865ca63887098e0945fb4e93c852b91b0f)
>
> What about CVE-2018-16865, E.G. commit 052c57f132f04a / ef4d6abe7c7fa?
> Do those not apply to 240?
So here https://www.qualys.com/2019/01/09/system-down/system-down.txt it says:
"CVE-2018-16865 was introduced in December 2011 (systemd v38) and became
exploitable in April 2013 (systemd v201). CVE-2018-16866 was introduced
in June 2015 (systemd v221) and was inadvertently fixed in August 2018."
So my assumption was that we didn't need patches for CVE-2018-16865
since systemd 240 was released in Dec 2018.
>
> --
> Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Jan 2019 11:46:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: add upstream fix for
 CVE-2018-16864
In-Reply-To: <1547193242-29882-1-git-send-email-james.hilliard1@gmail.com>
 (james's message of "Fri, 11 Jan 2019 15:54:02 +0800")
References: <1547193242-29882-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <87sgxzqxny.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "james" == james hilliard1 <james.hilliard1@gmail.com> writes:

 > From: James Hilliard <james.hilliard1@gmail.com>
 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 >  ...-not-store-the-iovec-entry-for-process-co.patch | 205 +++++++++++++++++++++
 >  1 file changed, 205 insertions(+)
 >  create mode 100644 package/systemd/0004-journald-do-not-store-the-iovec-entry-for-process-co.patch

 > diff --git
 > a/package/systemd/0004-journald-do-not-store-the-iovec-entry-for-process-co.patch
 > b/package/systemd/0004-journald-do-not-store-the-iovec-entry-for-process-co.patch
 > new file mode 100644
 > index 0000000..dbf9bb5
 > --- /dev/null
 > +++ b/package/systemd/0004-journald-do-not-store-the-iovec-entry-for-process-co.patch
 > @@ -0,0 +1,205 @@
 > +From 084eeb865ca63887098e0945fb4e93c852b91b0f Mon Sep 17 00:00:00 2001
 > +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
 > +Date: Wed, 5 Dec 2018 18:38:39 +0100
 > +Subject: [PATCH] journald: do not store the iovec entry for process
 > + commandline on stack
 > +
 > +This fixes a crash where we would read the commandline, whose length is under
 > +control of the sending program, and then crash when trying to create a stack
 > +allocation for it.
 > +
 > +CVE-2018-16864
 > +https://bugzilla.redhat.com/show_bug.cgi?id=1653855
 > +
 > +The message actually doesn't get written to disk, because
 > +journal_file_append_entry() returns -E2BIG.
 > +
 > +[james.hilliard1 at gmail.com: backport from upstream commit
 > +084eeb865ca63887098e0945fb4e93c852b91b0f]
 > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

The "standard way" to backport is to use git cherry-pick -sx which adds
a line like:

(cherry picked from commit 084eeb865ca63887098e0945fb4e93c852b91b0f)

What about CVE-2018-16865, E.G. commit 052c57f132f04a / ef4d6abe7c7fa?
Do those not apply to 240?

-- 
Bye, Peter Korsgaard

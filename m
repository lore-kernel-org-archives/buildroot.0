From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2020 08:53:40 +0100
Subject: [Buildroot] [PATCH v1] package/kmsxx: fix gcc-10.x compile
In-Reply-To: <20201129224213.355228ad@gmx.net> (Peter Seiderer's message of
 "Sun, 29 Nov 2020 22:42:13 +0100")
References: <20201129093823.10286-1-ps.report@gmx.net>
 <875z5nq2nl.fsf@dell.be.48ers.dk> <20201129224213.355228ad@gmx.net>
Message-ID: <87360r1drv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

 >> > +++ b/package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porti.patch
 >> > @@ -0,0 +1,27 @@
 >> > +From f7ee1e8c96ffbfc645487e483b928d250a7e79ec Mon Sep 17 00:00:00 2001
 >> > +From: Tobias Off <sebastianoff@web.de>
 >> > +Date: Thu, 8 Oct 2020 22:37:55 +0200
 >> > +Subject: [PATCH] added #include <string> to card.h to follow gcc10 porting
 >> > + guide
 >> > +
 >> > +[Upstream: https://github.com/tomba/kmsxx/commit/b53f9d383c9189a897c44cd88a8fc1b871fdc8a2.patch]
 >> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 >> 
 >> NIT: Why do you end with a different commit hash than the upstream one
 >> (E.G. The From line)?

 > Is a change of the hash not normal while re-basing and adding something to
 > the commit message?

If you need to rebase, yes.

 > Produced the patch with the following workflow:

 > 	$ wget https://github.com/tomba/kmsxx/commit/b53f9d383c9189a897c44cd88a8fc1b871fdc8a2.patch
 > 	$ git am b53f9d383c9189a897c44cd88a8fc1b871fdc8a2.patch
 > 	$ vi kms++/inc/kms++/card.h     # fixing re-base conflicts
 > 	$ git add kms++/inc/kms++/card.h
 > 	$ git am --continue
 > 	$ git commit --amend --signoff
 > 	$ git format-patch -1

Given that the patch was just adding a single include, I thought it
would apply cleanly to our version. For such cases, you can simply do:

git clone https://github.com/tomba/kmsxx/
git format-patch -s --start-number=2 \
 b53f9d383c9189a897c44cd88a8fc1b871fdc8a2^..b53f9d383c9189a897c44cd88a8fc1b871fdc8a2
0002-added-include-string-to-card.h-to-follow-gcc10-porti.patch

But looking closer, the memory/cstdint includes close to this line would
indeed give issues.

-- 
Bye, Peter Korsgaard

From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:48:59 +0200
Subject: [Buildroot] [PATCH 03/34] reproducibility: generate
	SOURCE_DATE_EPOCH
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-3-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When reproducibility is wanted, generates a global SOURCE_DATE_EPOCH
environment variable which contains either the date of buildroot last
commit if running from a git repository, or the latest release date.

This means that all packages embedding build dates will appear to
have the same build date, so in case of new commit or release, all
packages will appear to have been change, even though some of them
may not have changed in fact.
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 86b2ed2..c1d2961 100644
--- a/Makefile
+++ b/Makefile
@@ -223,6 +223,11 @@ ifeq ($(BR2_REPRODUCIBLE),y)
 export TZ=UTC
 export LANG=C
 export LC_ALL=C
+SOURCE_DATE_GIT = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
+SOURCE_DATE_CHANGES = $(shell head -n 1 $(TOPDIR)/CHANGES | \
+	sed 's/^.*Released \(.*\)$$/\1/;s/\(st\|nd\|rd\|th\),//' | \
+	LANG=C LC_ALL=C TZ=UTC xargs -i date -d \{\} +%s)
+export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(SOURCE_DATE_GIT),$(SOURCE_DATE_CHANGES))
 endif
 
 # To put more focus on warnings, be less verbose as default
-- 
2.7.4

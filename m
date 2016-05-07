From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 15:20:50 +0200
Subject: [Buildroot] [PATCH 03/34] reproducibility: generate
 SOURCE_DATE_EPOCH
In-Reply-To: <1462002570-14706-3-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-3-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507152050.7a143515@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 09:48:59 +0200, Gilles Chanteperdrix wrote:
> When reproducibility is wanted, generates a global SOURCE_DATE_EPOCH

wanted -> requested

generates -> generate

> environment variable which contains either the date of buildroot last
> commit if running from a git repository, or the latest release date.
> 
> This means that all packages embedding build dates will appear to
> have the same build date, so in case of new commit or release, all
> packages will appear to have been change, even though some of them
> may not have changed in fact.

Missing SoB.

> +SOURCE_DATE_GIT = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
> +SOURCE_DATE_CHANGES = $(shell head -n 1 $(TOPDIR)/CHANGES | \
> +	sed 's/^.*Released \(.*\)$$/\1/;s/\(st\|nd\|rd\|th\),//' | \
> +	LANG=C LC_ALL=C TZ=UTC xargs -i date -d \{\} +%s)

Yirk. I'm wondering if we shouldn't simply have a BR2_RELEASE_DATE
variable next to BR2_VERSION in the top level Makefile that gives the
release date.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

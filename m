From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jul 2020 17:37:48 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-07-12
In-Reply-To: <CAJe0E3fag3pVOjp+4ZHTq8mpVB7Ni18k0jrM_Bz_huxKa3QP3w@mail.gmail.com>
References: <5f0c105a.1c69fb81.17d79.8de3SMTPIN_ADDED_MISSING@mx.google.com>
 <CAJe0E3fag3pVOjp+4ZHTq8mpVB7Ni18k0jrM_Bz_huxKa3QP3w@mail.gmail.com>
Message-ID: <20200717173748.2485d781@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Matt in Cc. Matt, we detected an incorrect thing in the NVD database,
see below.

On Fri, 17 Jul 2020 15:01:26 +0200
Guillaume Bres <guillaume.bressaix@gmail.com> wrote:

> Indeed I am using this lib to be able to (cross)compile 'dsniff' library,
> but I did not want to introduce 'dsniff' to buildroot.
> Do you consider this a problem, knowing that only one package requires this
> lib & it is currently not integrated to Buildroot and, in my opinion,
> should remain as is,

There is a one line patch that Debian applied back in the days to fix
this vulnerability:

  https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=576281;filename=CVE-2010-1144.patch;msg=5

However, this issue is fixed upstream in 1.24, as the code contains:

static void
ip_evictor(void)
{
  // fprintf(stderr, "ip_evict:numpack=%i\n", numpack);
  while (this_host && this_host->ip_frag_mem > IPFRAG_LOW_THRESH) {

This is consistent with the fact that Debian, which is packaging
version 1.24, no longer has the CVE patch.

This is even listed in the CHANGES file of the project:

v1.24 Mar 14 2010
- fixed another remotely triggerable NULL dereference in ip_fragment.c

The issue is that the NVD database entry for this CVE is wrong: it says
that version 1.24 is affected, while in fact it got fixed in 1.24. This
needs to be fixed in the NVD database. This libnids project
unfortunately doesn't have a publicly available version control system
with all the history, so it's not easy to say which versions are
affected, but at least versions prior to 1.24 are affected.

Matt: do you think we can get this to be fixed from the NVD database ?

In the mean time, in Buildroot I think we could add this CVE to
LIBNIDS_IGNORE_CVES, with a comment that say there's a bug in the NVD
database. You can send a patch that does that Guillaume if you want.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

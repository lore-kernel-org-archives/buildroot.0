From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 21 Jul 2020 10:13:03 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-07-12
In-Reply-To: <20200717173748.2485d781@windsurf.home>
References: <5f0c105a.1c69fb81.17d79.8de3SMTPIN_ADDED_MISSING@mx.google.com>
 <CAJe0E3fag3pVOjp+4ZHTq8mpVB7Ni18k0jrM_Bz_huxKa3QP3w@mail.gmail.com>
 <20200717173748.2485d781@windsurf.home>
Message-ID: <CANQCQpbx8cHi4reD2ScvubHQCfa_fGzz020KzRNmObhBA8iyWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas / Guillaume


On Fri, Jul 17, 2020 at 10:39 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> +Matt in Cc. Matt, we detected an incorrect thing in the NVD database,
> see below.
>
> On Fri, 17 Jul 2020 15:01:26 +0200
> Guillaume Bres <guillaume.bressaix@gmail.com> wrote:
>
> > Indeed I am using this lib to be able to (cross)compile 'dsniff' library,
> > but I did not want to introduce 'dsniff' to buildroot.
> > Do you consider this a problem, knowing that only one package requires this
> > lib & it is currently not integrated to Buildroot and, in my opinion,
> > should remain as is,
>
> There is a one line patch that Debian applied back in the days to fix
> this vulnerability:
>
>   https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=576281;filename=CVE-2010-1144.patch;msg=5
>
> However, this issue is fixed upstream in 1.24, as the code contains:
>
> static void
> ip_evictor(void)
> {
>   // fprintf(stderr, "ip_evict:numpack=%i\n", numpack);
>   while (this_host && this_host->ip_frag_mem > IPFRAG_LOW_THRESH) {
>
> This is consistent with the fact that Debian, which is packaging
> version 1.24, no longer has the CVE patch.
>
> This is even listed in the CHANGES file of the project:
>
> v1.24 Mar 14 2010
> - fixed another remotely triggerable NULL dereference in ip_fragment.c
>
> The issue is that the NVD database entry for this CVE is wrong: it says
> that version 1.24 is affected, while in fact it got fixed in 1.24. This
> needs to be fixed in the NVD database. This libnids project
> unfortunately doesn't have a publicly available version control system
> with all the history, so it's not easy to say which versions are
> affected, but at least versions prior to 1.24 are affected.
>
> Matt: do you think we can get this to be fixed from the NVD database ?
>

I've submitted the following request to fix this

1) Navigated to https://cveform.mitre.org/
2) "Select a request type" as "Request and update to an existing CVE Entry"
3) "Type of update requested" as "Update Description"
4) "CVE ID to be updated" as 2010-0751
5) "Description" as "We've found that the v1.24 fixes the CVE and all
prior versions contain the bug.  The CVE currently lists that 1.24 is
still vulnerable.  This can be proved by checking the CHANGES file
within the source archive
(https://sourceforge.net/projects/libnids/files/libnids/1.24/libnids-1.24.tar.gz/download)
that outlines this ("fixed another remotely triggerable NULL
dereference in ip_fragment.c") comment.  Also within that archive the
source code src/ip_fragment on line 378 has the fix
(https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=576281;filename=CVE-2010-1144.patch;msg=5)
(NOTE 2010-1144 is a rejected CVE which was split to include
2010-0751)."


Thomas, do you think it would be beneficial to add a section with
these notes in the manual?

Best Regards,
Matt

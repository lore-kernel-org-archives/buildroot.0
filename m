From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Aug 2016 00:44:54 +0200
Subject: [Buildroot] [PATCH 2/2] doc: add libtool issue as Know issues
In-Reply-To: <1471259370-2914-2-git-send-email-romain.naour@gmail.com>
References: <1471259370-2914-1-git-send-email-romain.naour@gmail.com>
 <1471259370-2914-2-git-send-email-romain.naour@gmail.com>
Message-ID: <a1aa9d0d-fc69-9ee1-05b6-18377e9535db@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-08-16 13:09, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  docs/manual/known-issues.txt     | 4 ++++
>  support/legal-info/README.header | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
> index acfe4ff..d89507e 100644
> --- a/docs/manual/known-issues.txt
> +++ b/docs/manual/known-issues.txt
> @@ -33,3 +33,7 @@
>  * The +prboom+ package triggers a compiler failure with the SuperH 4
>    compiler from Sourcery CodeBench, version 2012.09.
>  
> +* [2016.08] The libtool patches are not listed as package patches due
> +  to a technical issue. Thereby they are not taken into account by the
> +  legal-info infra. This will be fixed in a follow up Buildroot
> +  release.

 Personally, I don't see a reason to fix this. The only real fix would be to
generate a patch file on the complete tree after the libtool patch has been
applied to all ltmain.sh. However:

- The libtool patch will not even have been applied for AUTORECONF packages when
'make legal-info' is done without building first.

- This patch is pretty specific to buildroot, buildroot should be distributed
together with the rest of the source, so there is no technical need to have this
patch.

- ltmain.sh doesn't end up on the target so it's not part of the "complete and
corresponding source". It is part of the scripts needed for building, but so is
buildroot, so see above.

 So for me, the additional complexity of properly dealing with the libtool patch
is really not worth it ("keep things simple"). The comment in README.header is
sufficient. Therefore, I would not put this in the Known issues section, but
instead move it to the legal-notice.txt. BTW, the current text about patches
there is not up-to-date, because it still says that patches are not saved. I
propose to change it to the following (copied from README.header):

* The source code for all packages; this is saved in the +sources/+ and
  +host-sources/+ subdirectories for target and host packages respectively.
  The source code for packages that set +<PKG>_REDISTRIBUTE = NO+ will not be
  saved.
  Patches that were applied are also saved, along with a file named +series+
  that lists the patches in the order they were applied. Patches are under the
  same license as the files that they modify.
  Note: Buildroot applies additional patches to Libtool scripts of autotools
  packages. These patches can be found under +support/libtool+ in the buildroot
  source and are not saved with the package sources due to technical
  limitations. You may need to collect it manually.


> diff --git a/support/legal-info/README.header b/support/legal-info/README.header
> index 1f3524f..6ba8b56 100644
> --- a/support/legal-info/README.header
> +++ b/support/legal-info/README.header
> @@ -20,6 +20,9 @@ This material is composed of the following items.
>     with a file named 'series' that lists the patches in the order they were
>     applied. Patches are under the same license as the files that they modify
>     in the original package.
> +   Note: Libtool patches from support/libtool/buildroot-libtool-v*..patch,
> +   used by autotools based packages, have not been saved due to technical
> +   limitations, you may need to collect it manually.

 OK, but I think my version above is still a little better :-)


 Regards,
 Arnout


>   * A manifest file listing the configured packages and related information.
>   * The license text of the packages; they have been saved in the licenses/
>     subdirectory.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 16:21:55 +0200
Subject: [Buildroot] [PATCH 1/3 v2] core/pkg-generic: rmove intermediate
 file-list files
In-Reply-To: <dedc397770e0af15eac2c7cbac771dbd9260c716.1491427248.git.yann.morin.1998@free.fr>
References: <cover.1491427248.git.yann.morin.1998@free.fr>
 <dedc397770e0af15eac2c7cbac771dbd9260c716.1491427248.git.yann.morin.1998@free.fr>
Message-ID: <9a943961-9c5f-afad-c7e4-99d2e2d9baf5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 s/rmove/remove/

On 05-04-17 23:20, Yann E. MORIN wrote:
> To compute the list of files added by a package, we first store the list
> of files before the install, do the install, list the files after the
> install, and finally compare the two lists. The two lists are stored in
> dot-files, hidden in the package's build dir.
> 
> We currently keep those two files, and only list the files installed in
> target/
> 
> In followup patches, we'll also list files installed in staging/ as well
> as files installed in host/.
> 
> Rather than add even more internal, hidden files in the package build
> dir, we'll just re-use the same two temporary files to store the bfore
                                                                    ^e
> and after lists.

 Actually, I like to have as much as possible build info lingering around, so
I'd tend not to do this removal and instead rename to something with 'target' in
it. For example, I think we have no other way at the moment to detect when two
packages write the same file. IMO having internal hidden files in the package
build dir doesn't hurt anyone. I certainly do like the applied patches list!

 That said, I don't see any other reason to keep those files, and we probably
want explicit support for detecting collisions, so I'm OK with removing them
after all.

 Regards,
 Arnout

> 
> So, remove them after the comparison is done.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 31dbc54..6b3c69c 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -78,6 +78,7 @@ define step_pkg_size_end
>  		while read hash file ; do \
>  			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
>  		done
> +	rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
>  endef
>  
>  define step_pkg_size
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

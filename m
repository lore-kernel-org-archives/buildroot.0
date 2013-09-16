From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Sep 2013 22:07:02 +0200
Subject: [Buildroot] [PATCH v3] apply-patches.sh: detect missing patches
In-Reply-To: <20130916194547.GA1223@harvey.netwinder.org>
References: <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
 <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
 <20130913181527.GA11933@harvey.netwinder.org> <20130913182702.GB3301@free.fr>
 <20130915133709.GA16826@harvey.netwinder.org>
 <20130915141314.GA18166@harvey.netwinder.org>
 <8738p5lud2.fsf@dell.be.48ers.dk> <8738p5i6kq.fsf@dell.be.48ers.dk>
 <20130916172444.2573614e@skate> <20130916194547.GA1223@harvey.netwinder.org>
Message-ID: <523764E6.1050109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/09/13 21:45, Ralph Siemsen wrote:
> Many of those packages actually build fine, because they explicitly apply only
> the contents of the debian/patches directory. For example from thttpd.mk:
>
> define THTTPD_DEBIAN_PATCHES
>          if [ -d $(@D)/debian/patches ]; then \
>                  support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
>          fi
> endef
>
> The only broken packages are: cvs sysvinit liblockfile setserial
>
> So we have a couple of options:
>   1) revert the original change back to a warning, or
>   2) fixup the four broken packges using the same method.
>   3) something else.
>
> I'm not sure which way to go, please give me your thoughts.

  The issue with e.g. cvs is not that the patch format is wrong, but 
rather that the patch files don't have the .patch extension:

$ ls build/cvs-1.12.13/debian/patches/
10_rsc2log_fix                  67_date_format_option 

11_check_method_crash           68_DSA_external_passwd_file
12_rcs2log_POSIX_sort           69_ext_allowroot
14_ext_expansion                71_cvsbug_tmpfix
15_PATH_MAX_check               80_cvs-repouid-0.1
20_readdir_errno                81_fix_-l
21_getcwd_chroot                85_normalize_correct_roots
25_import-n-X                   86_server_wrapper
30_quieten_syslog_errors        89_history_val-tag_world_writeable
31_ipv6                         90zlib-read-compressed.diff
51_newlines_in_commit_template  93_homedir
55_keyword_alphanumerics        94_parseopts
56_extra_tags                   95_flag_conflicted_copies
60_PAM_support                  96_manpage_fixes
61_remove_-R_warning            97_cvs.info.typo
62_cvsrc_whitespace             98_fix_sparc_sigbus.diff
65_login_cvspass_message        99_copyright
66_64bit_crashfix

  Of course, before your commit, all these patches (except the few ending 
with .diff) were silently ignored, so we can wonder if these debian 
patches are actually even necessary...


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

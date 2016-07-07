From: Benjamin Kamath <kamath.ben@gmail.com>
Date: Thu, 7 Jul 2016 05:23:53 +0000 (UTC)
Subject: [Buildroot]
	=?utf-8?q?=5BPATCH_v9_03/11=5D_support/scripts=3A_add?=
	=?utf-8?q?_fix-rpath_script=09+_a_bunch_of_helpers?=
References: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
 <1461358223-18312-4-git-send-email-s.martin49@gmail.com>
Message-ID: <loom.20160707T070046-781@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel Martin <s.martin49@...> writes:

> 
> This commit introduces a fix-rpath shell-script able to scan a tree,
> detect ELF files, check their RPATH and fix it in a proper way.
> 
> Along to the fix-rpath script, it also adds a bunch of shell helper
> functions grouped into modules. This will help writing scripts 
handling
> RPATH and other things, while allowing to share and reuse these
> functions between scripts.
> 
> These helpers are namespaced within the filename of the module in 
which
> they are gathered.
> 
> This change adds 6 modules:
> - source.sh: provides simple helper to easily source another module, 
taking
>   care of not sourcing again an already-sourced one;
> - log.sh: provides logging helpers;
> - utils.sh: provides simple functions to filter ELF files in a list;
> - readelf.sh: provides functions retrieving ELF details from a file;
> - patchelf.sh: provides function updating ELF files;
> - sdk.sh: provides RPATH computation functions.
> 
> These 6 modules are used by the fix-rpath script.
> Follow-up patches will make some scripts leveraging these modules.
> 
> Signed-off-by: Samuel Martin <s.martin49@...>
Tested-by: Benjamin Kamath <kamath.ben@gmail.com>
> 
> ---
> changes v8->v9:
> - none
> 
> changes v7->v8:
> - slightly rework log.error (return non-0 instead of exiting; exit
>   decision is deferred to the caller)
> 
> changes v6->v7 (includes changes started during BR dev. days):
> - log module:
>   - debug env. var. renamed: DEBUG -> SHELL_DEBUG
>   - trace now prints the message level
> - patchelf module:
>   - get rid of XRPATH/XORIGIN stuff (Arnout)
>   - set_rpath now handles ELF files with no .dynamic section
>   - cleanup and minor fix in sanitize_rpath
> - readelf module:
>   - move {filter,is}_elf* functions from utils to readelf modules
>   - add list_sections and has_section functions (needed in
>     sanitize_rpath)
> - sdk modules:
>   - get rid of XRPATH/XORIGIN stuff (Arnout)
>   - minor functions doc. fixes
> - source module:
>   - move "Could not load module" error message in load_module (Arnout)
> - utils module:
>   - move {filter,is}_elf* functions from utils to readelf modules
>   - add list_has function
> - fix-rpath:
>   - runs with "set -e" (exit on error)
>   - improve help text
>   - slight refactoring because of modules changes
> 
> changes v5->v6:
> - fully rewritten in shell
> 
> changes v4->v5:
> - add verbose support
> - rename shrink_rpath -> clear_rpath
> - add sanitize_rpath function
> 
> changes v3->v4:
> - fix typos and license (Baruch)
> 
> changes v2->v3:
> - no change
> ---
>  support/scripts/fix-rpath         | 116 +++++++++++++++++++++++++
>  support/scripts/shell/log.sh      |  61 +++++++++++++
>  support/scripts/shell/patchelf.sh | 178 
++++++++++++++++++++++++++++++++++++++
>  support/scripts/shell/readelf.sh  | 173 
++++++++++++++++++++++++++++++++++++
>  support/scripts/shell/sdk.sh      |  68 +++++++++++++++
>  support/scripts/shell/source.sh   |  77 +++++++++++++++++
>  support/scripts/shell/utils.sh    |  60 +++++++++++++
>  7 files changed, 733 insertions(+)
>  create mode 100755 support/scripts/fix-rpath
>  create mode 100644 support/scripts/shell/log.sh
>  create mode 100644 support/scripts/shell/patchelf.sh
>  create mode 100644 support/scripts/shell/readelf.sh
>  create mode 100644 support/scripts/shell/sdk.sh
>  create mode 100644 support/scripts/shell/source.sh
>  create mode 100644 support/scripts/shell/utils.sh
> 

I tested the fix-rpath script on multiple toolchains, and it 
successfully made them relocatable. One thing I did notice was that once 
the TREE_ROOT was set and called with the script once, I could no longer 
call the script to set a more specific TREE_ROOT, i.e. moving ${O} down 
a folder. This isn't a huge deal, but did mean I needed to rebuild the 
toolchain before packaging it the way I wanted to. Another option would 
be trim automatically, so if the user selected a TREE_ROOT as 
$(some_path)/foo, but there weren't any elfs until a depth of 
$(some_path)/foo/bar/cow, automatically readjust the TREE_ROOT to be the 
more specific path.

This is a minor issue though, and it was pretty handy to be able to make 
relocatable host tools so I think functionally it is still very useful 
as is.

Also there were quite a few spelling typos in the scripts themselves / 
commit messages, so I'd run it through a quick spellcheck as well.

Cheers,
Ben

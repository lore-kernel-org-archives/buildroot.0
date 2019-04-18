From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Apr 2019 16:53:44 +0200
Subject: [Buildroot] [RFC 1/1] br2-external: Alow to include toolchain
 from external tree
In-Reply-To: <a37f9f50-381a-cdfb-4d78-bd78bbdd9f4c@mind.be>
References: <20190417204630.18746-1-vadim4j@gmail.com>
 <a37f9f50-381a-cdfb-4d78-bd78bbdd9f4c@mind.be>
Message-ID: <20190418145344.GA21166@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Vadim, All,

On 2019-04-17 23:26 +0200, Arnout Vandecappelle spake thusly:
> On 17/04/2019 22:46, Vadim Kochan wrote:
> > Add possibility to select toolchain from br2-external tree which
> > allows to easy use custom external toolchains by selecting them via
> > menuconfig as if they were integrated into buildroot.
> > 
> > The br2-external tree should contain:
> > 
> > 	${br2-external}/external-toolchain/Config.in
> > 
> > file to be included into external toolchains list.
> > 
> > All such picked toolchains are sourced in:
> > 
> > 	toolchain/toolchain-external/Config.in
> > 
> > from auto-generated file ${O}/build/.br2-external.in.toolchain.
> 
>  Bikeshedding time: I would call the file .br2-external-toolchain.in.

Ditto.

> > Added new '-t' option in support/scripts/br2-external to generate
> > kconfig for the found toolchains from the all specified external trees.
> > 
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > ---
> > 
> > This is just PoC to rise the discussion about this concept.
> > 
> >  Makefile                               |  6 +++++-
> >  support/scripts/br2-external           | 36 ++++++++++++++++++++++++++++++++--
> >  toolchain/toolchain-external/Config.in |  2 ++
> >  3 files changed, 41 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 522c0b0606..4eceb88813 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -938,7 +938,7 @@ HOSTCFLAGS = $(CFLAGS_FOR_BUILD)
> >  export HOSTCFLAGS
> >  
> >  .PHONY: prepare-kconfig
> > -prepare-kconfig: outputmakefile $(BUILD_DIR)/.br2-external.in
> > +prepare-kconfig: outputmakefile $(BUILD_DIR)/.br2-external.in $(BUILD_DIR)/.br2-external.in.toolchain
> >  
> >  $(BUILD_DIR)/buildroot-config/%onf:
> >  	mkdir -p $(@D)/lxdialog
> > @@ -1042,6 +1042,10 @@ endif
> >  $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
> >  	$(Q)support/scripts/br2-external -k -o "$(@)" $(BR2_EXTERNAL)
> >  
> > +.PHONY: $(BUILD_DIR)/.br2-external.in.toolchain
> > +$(BUILD_DIR)/.br2-external.in.toolchain: $(BUILD_DIR)
> > +	$(Q)support/scripts/br2-external -t -o "$(@)" $(BR2_EXTERNAL)
> 
>  I don't like much that it's a separate target. However, it's consistent with
> how .br2-external.in is called, so it's OK as it is.

If at all, I would have tried to make it a single target as well.

However, it would require a bit of reachitecting the file, and so maybe
it is not worht the effort...

But now, the 'kconfig' -k option is misleading, because it does no
longer generate the whole kconfig stuff; it only generates parts of it.
But I don't havea better idea either... :-(

Oh, what about removing the '-o' opiton, and requiring each type to
expect the output file as arg :

  - $(BUILD_DIR)/.br2-external.mk is generated with a call like:

        support/scripts/br2-external -m /path/to/.br2-external.mk $(BR2_EXTERNAL)

  - $(BUILD_DIR)/.br2-external.in and $(BUILD_DIR)/.br2-external-toolchain.in
    are generated with a single call like so:

        support/scripts/br2-external -k /path/to/.br2-external.in -t /path/to/.br2-external-toolchain.in $(BR2_EXTERNAL)

> >  # printvars prints all the variables currently defined in our
> >  # Makefiles. Alternatively, if a non-empty VARS variable is passed,
> >  # only the variables matching the make pattern passed in VARS are
> > diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> > index 00cb57d1ed..3ec332d93e 100755
> > --- a/support/scripts/br2-external
> > +++ b/support/scripts/br2-external
> > @@ -16,10 +16,11 @@ main() {
> >      local OPT OPTARG
> >      local br2_ext ofile ofmt
> >  
> > -    while getopts :hkmo: OPT; do
> > +    while getopts :htkmo: OPT; do
> >          case "${OPT}" in
> >          h)  help; exit 0;;
> >          o)  ofile="${OPTARG}";;
> > +        t)  ofmt="toolchain";;

Keep options in alphabetical order, except help which goes first.

> >          k)  ofmt="kconfig";;

And thus you'd have to be smart here, like so:

    do_kconfig=false
    do_mk=faile
    do_toolchain=false
    while getopts :ht:k:m: OPT; do
        case "${1}" in
        (m)     do_kconfig=true; kconfig_file="${OPTARG}";;
        (k)     do_mk=true; mk_file="${OPTARG}";;
        (t)     do_toolchain=true; toolchain_file="${OPTARG}";;
        esac
    done

This is missing the error case and help, but you get the idea. You could
also check that do_toolchain and do_kconfig must be identical (both
false or both true) and that it do_mk is incompatible with do_kconfig.

It would then be used as:

    if ${do_kconfig}; then gen_kconfig >"${kconfig_file}"; fi
    if ${do_mk}; then gen_mk >"${mk_file}"; fi
    if ${do_toolchain}; then gen_toolchain >"${toolchain_file}"; fi

> >          m)  ofmt="mk";;
> >          :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
> > @@ -30,7 +31,7 @@ main() {
> >      shift $((OPTIND-1))
> >  
> >      case "${ofmt}" in
> > -    mk|kconfig)
> > +    mk|kconfig|toolchain)
> >          ;;
> >      *)  error "no output format specified (-m/-k)\n";;
> >      esac
> > @@ -188,6 +189,37 @@ do_kconfig() {
> >      printf "endmenu # User-provided options\n"
> >  }
> >  
> > +# Generate the toolchain kconfig snippet for the br2-external tree.
> > +do_toolchain() {
> > +    local br2_name br2_ext
> > +
> > +    printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
> > +    printf '\n'
> > +
> > +    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
> > +        printf '# No br2-external tree defined.\n'
> > +        return
> > +    fi
> > +
> > +    for br2_name in "${BR2_EXT_NAMES[@]}"; do
> > +        eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
> > +        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
> > +
> > +        if [ ! -f "${br2_ext}/toolchain-external/Config.in" ]; then
> > +            continue
> > +	fi
> 
>  There's some whitespace confusion here; this file uses spaces only.
> 
> > +
> > +        # we have to duplicate it here too because otherwise BR2_EXTERNAL_*
> > +	# is not evaluated in Config.in
> 
>  Argh, that's mightily annoying... But I don't really see a better solution. The
> reason is that .br2-external.in only gets included after all the other files
> have already been included. Normally Kconfig is indepdent of the order in which
> you declare things, but not when you use a variable in a source directive...
> 
>  I don't see a good way around it. We could have yet another
> .br2-external-variables.in that gets included *before* all the rest, but that's
> also pretty ugly...
> 
>  Yann, any ideas?

Gaaahhh... I don't have a very impressive solution either... :-(

Building on my proposal above, what about expanding to:

    -m -> .mk file

    -k -> kconfig variables _only_, included very early, probably in
          Config.in, before line 105 (source "arch/Config.in")

    -t -> toolchains

    -M -> kconfig menu only  (but uppercase 'M' is not nice, since we
          already have lowercase 'm'... maybe switch them?)

If you have a better idea, be my guest and shout it out loud. ;-)

>  Assuming there is no better solution than this one, the patch looks pretty much
> OK except for the whitespace. I believe it covers all cases. It would be nice if
> the file would also contain *something* if there are some externals but none of
> them have a toolchain-external/Config.in, but I don't think it's worth spending
> time on that.
> 
>  For the final patch there should also be documentation of course.

Documentation, what's that? ;-)

Yes, the manual should explain that, when this file exist in a
br2-external tree, it will be included in the toolchain choice, so it
should only contain the boolean options that define the external
toolchains.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> 
> > +        printf 'config BR2_EXTERNAL_%s_PATH\n' "${br2_name}"
> > +        printf '\tstring\n'
> > +        printf '\tdefault "%s"\n' "${br2_ext}"
> > +
> > +        printf 'source "%s/toolchain-external/Config.in"\n' "${br2_ext}"
> > +        printf '\n'
> > +    done
> > +}
> > +
> >  help() {
> >      cat <<-_EOF_
> >  	Usage:
> > diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> > index d234c1c552..70e8a89e5e 100644
> > --- a/toolchain/toolchain-external/Config.in
> > +++ b/toolchain/toolchain-external/Config.in
> > @@ -50,6 +50,8 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Confi
> >  # architecture.
> >  source "toolchain/toolchain-external/toolchain-external-custom/Config.in"
> >  
> > +source "$BR2_BUILD_DIR/.br2-external.in.toolchain"
> > +
> >  endchoice
> >  
> >  choice
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

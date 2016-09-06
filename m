From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Sep 2016 22:49:20 +0200
Subject: [Buildroot] [PATCH 2/9 v4] core: get rid of our dummy
 br2-external tree
In-Reply-To: <e20f1363-7c24-6995-81bf-1b7ad163406b@ecagroup.com>
References: <cover.1473109655.git.yann.morin.1998@free.fr>
 <ecefa302f03904fbc18a7138ed37e905c1316411.1473109655.git.yann.morin.1998@free.fr>
 <e20f1363-7c24-6995-81bf-1b7ad163406b@ecagroup.com>
Message-ID: <20160906204920.GA12105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2016-09-06 10:21 +0000, Julien CORJON spake thusly:
> I've just done a static read of your series and my comments are just 
> superficial as I'm not a kconfig/Makefile expert...
> 
> I will test all theses before any review/test tag but I do not have 
> enough time yet to do this in the few next days.

No problem. Thanks!

[--SNIP--]
> > diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> > index c15c21c..91f854a 100755
> > --- a/support/scripts/br2-external
> > +++ b/support/scripts/br2-external
> > @@ -19,9 +19,6 @@ main() {
> >      # Forget options; keep only positional args
> >      shift $((OPTIND-1))
> >
> > -    if [ ${#} -ne 1 ]; then
> > -        error "need exactly one br2-external tree to be specified\n"
> > -    fi
> 
> I don't understand why do you remove this check in this commit rather 
> than in patch "7 - core: add support for multiple br2-external trees"?

Because now, the script can be called with no br2-external tree as well.

But you are right, the test should not go away entirely. Instead, it
should test for 0 or 1 tree.

Good catch, I'll fix that. Thanks! :-)

Regards,
Yann E. MORIN.

> Regards,
> 
> Julien Corjon
> 
> >      br2_ext="${1}"
> >
> >      if [ -z "${ofile}" ]; then
> > @@ -38,6 +35,11 @@ main() {
> >  do_validate() {
> >      local br2_ext="${1}"
> >
> > +    # No br2-external tree is valid
> > +    if [ -z "${br2_ext}" ]; then
> > +        return
> > +    fi
> > +
> >      if [ ! -d "${br2_ext}" ]; then
> >          error "'%s': no such file or directory\n" "${br2_ext}"
> >      fi
> > @@ -49,12 +51,17 @@ do_validate() {
> >  do_kconfig() {
> >      printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
> >      printf '\n'
> > +
> > +    if [ -z "${BR2_EXT}" ]; then
> > +        printf '# No br2-external tree defined.\n'
> > +        return
> > +    fi
> > +
> >      printf 'config BR2_EXTERNAL\n'
> >      printf '\tstring\n'
> >      printf '\tdefault "%s"\n' "${BR2_EXT}"
> >      printf '\n'
> >      printf 'menu "User-provided options"\n'
> > -    printf '\tdepends on BR2_EXTERNAL != "support/dummy-external"\n'
> >      printf '\n'
> >      printf 'source "%s/Config.in"\n' "${BR2_EXT}"
> >      printf '\n'
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

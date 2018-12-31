From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Dec 2018 15:45:34 +0100
Subject: [Buildroot] [PATCH v7 3/8] core: implement per-package SDK and
 target
In-Reply-To: <20181231153101.387c7d57@windsurf>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228104335.22379-4-thomas.petazzoni@bootlin.com>
 <20181230215212.GA24224@scaer> <20181231153101.387c7d57@windsurf>
Message-ID: <20181231144534.GB21682@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-31 15:31 +0100, Thomas Petazzoni spake thusly:
> On Sun, 30 Dec 2018 22:52:12 +0100, Yann E. MORIN wrote:
> > > There are two main benefits:
> > >  - Packages will no longer discover dependencies that they do not
> > >    explicitly indicate in their <pkg>_DEPENDENCIES variable.  
> > Note that non-expressed dependencies may still be gathered, if they are
> > transitive dependencies.
> Yes, of course, but what can we do about this ?

What I mean is, if

  - A needs B and C, but has a dependency only on B,
  - B depends on C,

then the dependency of A to C is fullfilled, even though it is missing
in the dependencies. I.e, it is a _hidden_ dependency. It is not
"explicitly indicate[d] in A_DEPENDENCIES" but still gathered.

And no, there is nothing we can do about it.

> It's pretty logical and
> obvious that transitive dependencies will be copied, no ?

Not as you wrote it.

So, you could rephrase as:

    Packages will now see only the dependencies they explicitly list in
    their <pkg>_DEPENDENCIES variable, and the recursive dependencies
    thereof.

> > > +PER_PACKAGE_DIR := $(BASE_DIR)/per-package  
> > 
> > Why don't you simply export this variable, like HOST_DIR and TARGET_DIR?
> > This would simplify calls to fix-rpath:
> 
> Because I generally don't like those global exports. It pollutes the
> namespace with some random variable that is really internal to
> Buildroot. There is no reason for the build system of all packages to
> even see this variable. In fact, I am personally not a big fan of
> exporting TARGET_DIR, STAGING_DIR, etc. since they become visible in
> packages, and people tend to use them in their package build system,
> which is very wrong.
> 
> Of course, if the overall consensus is that PER_PACKAGE_DIR should be
> exported, I'll do so because I don't want to hold this series just for
> this detail.

Oh, I would tend to agree with you.

I'm just pointing a discrepancy in the way those variables are handled,
and I think it is good to have some consistency, especially in this
difficult topic, even though said consistency's not very nice...

[--SNIP--]
> > > @@ -77,6 +93,7 @@ check_elf_has_rpath() {
> > >              dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
> > >              [ "${dir}" = "${hostdir}/lib" ] && return 0
> > >              [ "${dir}" = "\$ORIGIN/../lib" ] && return 0
> > > +            [[ ${dir} =~ ${perpackagedir}/[^/]*/host/lib ]] && return 0  
> >                                             ^^^^^^^
> > That would also match the string '//' so maybe we want:
> > 
> >     ${perpackagedir}/([^/]+/)?host/lib
> 
> I'm not sure to understand the ? in ([^/]+/)?. We definitely want one
> path component between $(PER_PACKAGE_DIR) and host/lib. So what about:
> 
> 	${perpackagedir}/[^/]+/host/lib

Yes, that is it (and is what I eventually suggested in my review of
patch 5 (about fixing libtool.la files).

> > > +        if test "${rpath}" != "${changed_rpath}" ; then
> > > +            ${PATCHELF} --set-rpath ${changed_rpath} "${file}"  
> > 
> > Can't you do that unconditioanlly? If it's changed, we need to set it;
> > if it's not changed, that set it to the initial value anyway...
> 
> There is a reason to do it conditionally: patchelf is slow, you don't
> want to run patchelf when you don't need to, and here it's trivial to
> know whether it is useful or not to run it. For example, this condition
> ensures that people not using per-package directory don't pay the cost
> of running all those additional patchelf invocations.

OK.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

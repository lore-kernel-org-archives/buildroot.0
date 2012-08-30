From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Aug 2012 23:38:39 +0200
Subject: [Buildroot] libffi or the crazy world of toolchain options
In-Reply-To: <201208300053.32183.yann.morin.1998@free.fr>
References: <1345907166-29628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201208261223.46075.yann.morin.1998@free.fr>
 <201208262240.51214.yann.morin.1998@free.fr>
 <201208300053.32183.yann.morin.1998@free.fr>
Message-ID: <503FDD5F.4070007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/30/12 00:53, Yann E. MORIN wrote:
> Thomas, All,
>
> On Sunday 26 August 2012 22:40:50 Yann E. MORIN wrote:
> > On Sunday 26 August 2012 12:23:46 Yann E. MORIN wrote:
> > OK, now I have a shell+awk script (pkg-avail, attached) that:
> >    - adds a BR2_PACKAGE_XXX_AVAILABLE symbol for all packages
> >    - moves packages dependencies to that symbol
> >    - adds a single dependency against that symbol to the corresponding
> >      BR2_PACKAGE_XXX /main/ symbol
>
> OK, this is iteration 3 of the script.
>
> It now runs three pases:
>
> 1) - introduces a BR2_PACKAGE_XXX_AVAILABLE symbol
>     - moves all the package dependencies to this symbol
>     - has the package depends only on this symbol
  So that means the XXX_AVAILABLE is there even if the package has no
dependencies? I'm not sure I like that... It means the simplest packages
become more complex (only to make a few complex cases simpler).
A patch with a shortstat that adds 4500+ lines, that can't be right :-)

  Take the example of transmission: the size of its Config.in doubles, but
the real dependency is IPV6.  Adding all those "depends on ..._AVAILABLE"
which are always true only hide the real restriction here.

  So I propose to remove the _AVAILABLE symbols for packages that don't
have actual dependencies.  At the moment, those are easy to find because
the dependencies are present directly in the package (but of course the
intention is to remove those direct dependencies if they're actually due to
an indirect dependency).

=> In pass 1, only create the _AVAILABLE symbol if there is a depends on.
Also log in a file for which packages the _AVAILABLE was created

=> in pass 2 and 3, only execute the transformation if the _AVAILABLE
exists.


  Note that the disadvantage of restricting the _AVAILABLE to packages
that really need it, is that there's more work when a package acquires its first
toolchain dependency. Indeed, you have to add the _AVAILABLE symbol,
and look for all packages that select this one and add an _AVAILABLE
dependency. However, I think it doesn't often occur that a package
acquires a new (toolchain) dependency, and when it does it usually already
has an existing dependency (cfr. libglib2, python, xorg7, efl).  So, even
the libffi case wouldn't have cost much effort.


> 2) - transforms all 'depends on BR2_PACKAGE_XXX' into a dependency
>       on the corresponding _AVAILABLE symbol
>     - adds a select on the corresponding package
  Actually I don't think we want this step.  The "depends on BR2_PACKAGE_XXX"
construct is used to hide packages that depend on a super-feature, like
X11 or python. In other cases, it's used to reduce the size of the menus where
relevant; e.g. dbus-glib is only relevant if you have dbus. This isn't perfectly
clear-cut, but it shouldn't be done mechanically.

>
> 3) - checks and fixes 'select BR2_PACKAGE_XXX' that does not have a
>       corresponding 'depends on BR2_PACKAGE_XXX_AVAILABLE'

  What is missing as a fourth step is the removal of the dependencies which are
actually due to transitive dependencies. They can be detected because normally
we write
depends on BR2_USE_WCHAR # glib2
in such a situation.  But again, I wouldn't do this mechanically. There are only
85 of these comments, and you have the "depends on ..._AVAILABLE" below
to verify if the transitive dependency exists.


>
> NOTE: the coverage of this script is NOT 100%. Some manual inspection
> and fixes are still required.
>
> Pass 1 treats all 817 packages. After a quick glance, all appears OK,
> but a more thorough analysis must be conducted.

  The script looks correct to me - not much can go wrong here.

>
> Pass 2 finds 67 packages that needs munging. There are a few packages
> left over, becasue they ahve constructs like
>      depends on PKG_FOO || PKG_BAR

  Can be skipped :-)

>
> Pass 3 finds 401 packages that 'select' packages without a corresponding
> 'depends on' on the _AVAILABLE symbol. A casual glance found that pass
> to be pretty OK, although a complete analysis has not ben done so far.

  I've updated the script with my own feedback; it's attached.

  Now only 279 packages are munged in the first pass, and only 146 in the third
pass.  However, the third pass detects about twenty of packages with inconsistent
select/depends (e.g. automake selects microperl, but microperl depends on MMU).
These should be fixed first, of course!

  I haven't had time to test it though.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: pkg-avail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120830/bdb75552/attachment.ksh>

From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Fri, 6 Nov 2015 10:22:03 -0500
Subject: [Buildroot] BR2_EXTERNAL - Broken in 2015.08.01????
In-Reply-To: <20151106154102.6b72af73@free-electrons.com>
References: <CAN34foz=B-ig5Ci4kE=UKk6p2qws2Pp-qzaQGgCoXpXco6SAuw@mail.gmail.com>
 <20151105142958.60a38821@free-electrons.com>
 <CAN34foyu5iSPur6c7gNKsB+b6AZgkrbqQ8fP5CKH6jt_GYjTjw@mail.gmail.com>
 <20151105230545.581bf875@free-electrons.com>
 <CAN34foxQ3J=Vd5ZRDtj7X54eD9naRCk-+5-Hh7AuTXp19OBUGQ@mail.gmail.com>
 <20151106154102.6b72af73@free-electrons.com>
Message-ID: <CAN34foyWQxHW1t=157ePm8JDfxAT6NoCarGPxOtsXh6C56gJsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

* You State:*

package/ is just a suggestion, and you can organize it whichever way

you want. Buildroot does not enforce anything in that respect. There

can be sub-directories, just like we have sub-directories for certain

packages in Buildroot itself.


*And you also state:*

Package "foo" *must*:


 * Be implemented in package/foo/foo.mk

 * Have its Config.in option named BR2_PACKAGE_FOO

 * Use FOO_ as the prefix for all variables in foo.mk


Back to the original problem:  I have a External setup, with "packages"
specified in a custom directory structure, NOT in a "package" directory yet
the top level make does NOT build these external packages.  Why?  They are
only built if I explicity:  make <package> - then it works just fine. . .


I modified the ?leaf? config.in to declare BR2_EXTERNAL_<PKG> - re-run the
menu config, deslect, re-select, save, verify that the BR2_EXTERNAL_<PKG>
=y is in the top level .config.

Still does not build from ?make? (there is build directory present.)


Regards,

Stephen Beckwith



On Fri, Nov 6, 2015 at 9:41 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Stephen Beckwith,
>
> On Fri, 6 Nov 2015 09:12:50 -0500, Stephen Beckwith wrote:
>
> > Referencing Slide 232 - it states:  ?recommended structure? - and this
> > shows a structure beginning with <board> - hence my earlier question
> about
> > directory naming.
>
> Recommended != Mandatory.
>
> It is not because we *recommend* a certain structure that all aspects
> of this *recommended* structure are *mandatory*.
>
> And indeed, the board/ directory is not *mandatory*, it's a pure
> suggestion.
>
> >  Referencing the Manual, Section 9.1.1 - Implemeting layered
> > customizations.  I reviewed this, since in my setup, I will have what
> would
> > be considered a ?layered? setup:  A common directory with ~ 75 packages,
> > directories for ?platform? specific items, and then directories with
> items
> > from specific vendors that need to be included in the overall system.
>
> OK. There's no question in this paragraph, so I assume you're just
> giving some context. So far, everything looks right.
>
> > So based upon Section 9.1.1 - there is no ?package? directory here, which
> > contradicts your ?must? list for the naming conventions.
>
> Section 9.1.1 only shows an example organization for the board/
> directory, in which we recommend to store things like rootfs overlays,
> post-build scripts, Linux kernel configuration files, etc.
>
> Nowhere is section 9.1.1 talking about packages.
>
> Moreover, I never said that you *must* have a package/ directory in
> your BR2_EXTERNAL. *If* you have packages to implement in your
> BR2_EXTERNAL then we *recommend* to put their description in package/,
> in order to mimic the organization of Buildroot itself.
>
> >  -  Does each package need to be in a separate ?package/xyz?
> > directory or can there be a single package directory with multiple
> > sub-directories for each package?  Refer to Slide 232.
>
> package/ is just a suggestion, and you can organize it whichever way
> you want. Buildroot does not enforce anything in that respect. There
> can be sub-directories, just like we have sub-directories for certain
> packages in Buildroot itself.
>
> So something like:
>
>  + Config.in
>  + external.mk
>  + package
>    + foo1
>      + foo1.mk
>      + Config.in
>    + vendor1
>      + vendor1.mk
>      + vendor1-app1
>        + vendor1-app1.mk
>        + Config.in
>      + vendor1-app2
>        + vendor1-app2.mk
>        + Config.in
>
> is perfectly fine. Of course, you have to make sure that external.mk
> includes package/*/*.mk, and that vendor1.mk includes
> package/vendor1/*/*.mk. See the numerous examples of this available in
> Buildroot proper.
>
> > 1)  So all the Config.in files must follow the following convention:
> > BR2_EXTERNAL_<PACKAGE>?
>
> No. Please read the documentation again. The Config.in options for
> packages *must* be named BR2_PACKAGE_<pkg>
>
> > 2)  I can use BR2_EXTERNAL_<PACKAGE> in the foo.mk to clarify make
> > options, yes?
>
> I don't see why you need BR2_EXTERNAL_<PACKAGE> to clarify anything in
> the .mk files.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151106/73a70da5/attachment.html>

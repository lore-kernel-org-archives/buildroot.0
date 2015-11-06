From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Fri, 6 Nov 2015 09:12:50 -0500
Subject: [Buildroot] BR2_EXTERNAL - Broken in 2015.08.01????
In-Reply-To: <20151105230545.581bf875@free-electrons.com>
References: <CAN34foz=B-ig5Ci4kE=UKk6p2qws2Pp-qzaQGgCoXpXco6SAuw@mail.gmail.com>
 <20151105142958.60a38821@free-electrons.com>
 <CAN34foyu5iSPur6c7gNKsB+b6AZgkrbqQ8fP5CKH6jt_GYjTjw@mail.gmail.com>
 <20151105230545.581bf875@free-electrons.com>
Message-ID: <CAN34foxQ3J=Vd5ZRDtj7X54eD9naRCk-+5-Hh7AuTXp19OBUGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

   Thank you for your reply.  As an experienced embedded software developer
(33 years overall, 10+ years with embedded linux) I would like to provide
the following ?constructive feedback? regarding the documentation.


    As previously stated, I reviewed the Buildroot manual and the slides
(and lab notes).


Referencing Slide 232 - it states:  ?recommended structure? - and this
shows a structure beginning with <board> - hence my earlier question about
directory naming.


 Referencing the Manual, Section 9.1.1 - Implemeting layered
customizations.  I reviewed this, since in my setup, I will have what would
be considered a ?layered? setup:  A common directory with ~ 75 packages,
directories for ?platform? specific items, and then directories with items
from specific vendors that need to be included in the overall system.


So based upon Section 9.1.1 - there is no ?package? directory here, which
contradicts your ?must? list for the naming conventions.  This may/may not
be obvious to someone who works deeply in this project every day.  I?m
trying to understand these ?nuances? in the Buildroot setup so as I can
setup my system, in accordance with the requirements of Buildroot, yet
provide the flexibility I will need moving foward.


So - refering to Section 9.1.1 of the manual about ?layered customizations?
- And refering to my previous of the directory tree:

 -  Does each package need to be in a separate ?package/xyz? directory or
can there be a single package directory with multiple sub-directories for
each package?  Refer to Slide 232.

{  I?ll assume Buildroot is keying off of ?package? for processing needs? }


Questions:

1)  So all the Config.in files must follow the following convention:
BR2_EXTERNAL_<PACKAGE>?

{that was another boo-boo on my part - I used different names. . . }

2)  I can use BR2_EXTERNAL_<PACKAGE> in the foo.mk to clarify make options,
yes?


Best Regards,

Stephen Beckwith





On Thu, Nov 5, 2015 at 5:05 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Stephen Beckwith,
>
> On Thu, 5 Nov 2015 16:57:56 -0500, Stephen Beckwith wrote:
>
> >    After some more poking around, I was successful in getting the desired
> > build to work.  Here is what I found:
> > 1)  Typing "make" @ the top level does not seem to build the BR2_EXTERNAL
> > code.  Is there something missing here?  Or is this by design? (based
> upon
> > the fact that this code is not a "normal auto-something package") ??
>
> No, this is not by design. "make" should build all packages you have
> enabled in your configuration. If some packages don't get built even if
> they are enabled in the configuration, it's because you didn't comply
> with the naming conventions.
>
> Package "foo" *must*:
>
>  * Be implemented in package/foo/foo.mk
>  * Have its Config.in option named BR2_PACKAGE_FOO
>  * Use FOO_ as the prefix for all variables in foo.mk
>
> > Questions:
> > 1)  Can I have "layered" Config.in files in the BR2_EXTERNAL tree?  Or
> does
> > it all have to be done in one? (currently, it is layered)
>
> I'm not sure what you mean by "layered", but you definitely don't have
> to put everything in one Config.in file, it can source other Config.in
> files, like in Buildroot itself.
>
> Have you read the documentation at
> http://buildroot.org/downloads/manual/manual.html#customize-dir-structure
> ?
> Also, read
> http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf
> starting from slide 230.
>
> > 2)  Do I need to have a <directory>.mk for sub-directories, if they do
> > nothing?  If I specify the correct path to find the <pkg>.mk from
> > external.mk, is that OK?
>
> Yes, it is OK. In fact, we suggest that external.mk should contain
> something like:
>
> include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
>
> > 3)  is the <PKG>_VERSION in the <pkg>.mk used in any way other than the
> > build folder directory?
>
> Yes, it is generally used to define <pkg>_SOURCE, either explicitly (in
> your .mk file) or implicitly (if not provided in your .mk file).
>
> I.e:
>
> FOO_VERSION = 0.3.2
> FOO_SOURCE = foo-$(FOO_VERSION).tar.xz
>
> Or, when you don't explicitly give a value for FOO_SOURCE, the package
> infrastructure will automatically give it the value
> '<pkg>-$(FOO_VERSION).tar.gz'.
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151106/e3df6459/attachment.html>

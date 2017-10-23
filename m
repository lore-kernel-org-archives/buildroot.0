From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Oct 2017 00:18:19 +0200
Subject: [Buildroot] Advice needed: Problem with clashing make variables
 in pkg-generic.mk when building perl-xml-sax package.
In-Reply-To: <5106c5c9-62e9-494c-76d8-2bbee56a34e1@mind.be>
References: <DB5PR0701MB1992E58350C8DE5036F4DA61E0460@DB5PR0701MB1992.eurprd07.prod.outlook.com>
 <5106c5c9-62e9-494c-76d8-2bbee56a34e1@mind.be>
Message-ID: <20171023221819.GB18135@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joeri, Arnout, All,

On 2017-10-23 23:05 +0200, Arnout Vandecappelle spake thusly:
> On 23-10-17 16:41, Barbarien, Joeri (Nokia - BE/Antwerp) wrote:
> > Hello all,
> > 
> > When building perl-xml-sax (and its dependency perl-xml-sax-base) I noticed something strange in output/build/packages-file-list.txt:
> [snip]
> > The files that are listed for perl-xml-sax-0.99 are actually those built by perl-xml-sax-base
> > 
> > This is due to a clash of make variables in package/pkg-generic.mk:
> > 
> > $(2)_BASE_NAME  = $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
> > $(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
> > $(2)_DL_DIR =  $$(DL_DIR)
> > $(2)_DIR  =  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
> > 
> > Due to the unfortunate naming of the packages,
> > 
> > $($(2)_BASE_NAME) for perl-xml-sax clashes with as $($(2)_NAME) for perl-xml-sax-base, leading to this wrong behavior.
> 
>  Wow, good catch! Incredible that this works at all...

Yes, this is a very good catch... Damned... :-/

I am basically in line with the analysis by Arnout: any solution we
decide on will be a huge work.

I think we really need to sleep on it for a little while, because we
definitely must be very cafreful that a solution:

  - does not introduces regressions

  - can be applied in as systematice a way as possible

  - does not need a second round to fix a fallout.

I think I will wait coming back from ELCE before I have a deep look at
this, though.

Notice that we have a similar problem for host packages: a target package
that is named foo and has a host variant could be confused with a target
package that is named host-foo, and then we'd have a clash in the
variable names as well...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

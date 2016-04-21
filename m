From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 21 Apr 2016 09:58:30 +0300
Subject: [Buildroot] [PATCH 1/3] c-icap: avoid host library search path
In-Reply-To: <5717F63F.8040605@mind.be>
References: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
 <20160419211457.11d9bf2a@free-electrons.com>
 <20160420180433.GK2476@tarshish> <5717F63F.8040605@mind.be>
Message-ID: <20160421065830.GP2476@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Apr 20, 2016 at 11:35:59PM +0200, Arnout Vandecappelle wrote:
> On 04/20/16 20:04, Baruch Siach wrote:
> >On Tue, Apr 19, 2016 at 09:14:57PM +0200, Thomas Petazzoni wrote:
> >>On Tue, 19 Apr 2016 21:15:44 +0300, Baruch Siach wrote:
> >>>+C_ICAP_MAKE_OPTS = exec_prefix=$(STAGING_DIR)/usr
> >>
> >>This is not correct. Setting exec_prefix to $(STAGING_DIR)/usr is
> >>wrong. Instead, can you try to remove:
> >>
> >>    -rpath @libdir@
> >>
> >>from the various Makefile.am ?
> >
> >It turns out that forcing AUTORECONF is enough to fix the problem. I'm not
> >sure why. I have only noticed that after AUTORECONF, -lz appears explicitly in
> >the link command line, whereas before libz was linked in implicitly via
> >libicapapi.so NEEDED tag. Manually running the failed link command with -lz
> >added, fixes the link as well. I guess that -lz makes the linker search in
> >sysroot before rpath, but I could not find an explanation to this behaviour in
> >the ld documentation.
> 
>  As I wrote yesterday: -rpath is used for searching for NEEDED entries, not
> for searching for -l argument. And vice versa: -L is used to search for -l
> arguments, but not for NEEDED entries.

That explains the behaviour I see, thanks. The twist here is that -rpath does 
not search for libraries that were found already as a result of -l. This 
apparently means that -L would indirectly affect the results of -rpath search.

Do you have any reference to gcc/binutils documentation on that?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

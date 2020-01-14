From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Jan 2020 00:27:36 +0100
Subject: [Buildroot] [RFC PATCH] autotools: do not overwrite first
 include path
In-Reply-To: <fd9bee30fa6a1d7851f243f10e66a355@walle.cc>
References: <20191212085748.13802-1-michael@walle.cc>
 <53fbaa47-6e61-6be6-2aef-3daee6a698dc@mind.be>
 <fd9bee30fa6a1d7851f243f10e66a355@walle.cc>
Message-ID: <9bf713cc-6153-c06c-20bf-c9a3430955dd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/01/2020 11:52, Michael Walle wrote:
> Hi Arnout,
> 
> Am 2020-01-14 00:37, schrieb Arnout Vandecappelle:
[snip]
>> ?That said, I wonder: why don't we simply export ACLOCAL_PATH? I think with
>> that, we don't need the -I options in autoheader and autoconf any more, right?
> 
> You mean something like that:
> 
> ACLOCAL = $(HOST_DIR)/bin/aclocal -I $(ACLOCAL_DIR)
> ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
> 
> AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL_PATH="$(ACLOCAL_PATH)"
> ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)"
> AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf -f -i
> 
> That won't work if $(ACLOCAL) is used alone. But from what I see that isn't
> used for now. So we could give that a try.
> 
> Or rather something like that:
> ACLOCAL = $(HOST_DIR)/bin/aclocal -I $(ACLOCAL_DIR)
> ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
> export ACLOCAL_PATH
> 
> AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)"
> AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true
> $(HOST_DIR)/bin/autoreconf -f -i


 This second one is what I meant. But of course, this only works if autoconf and
automake don't need the explicit -I options.


> But that would clutter the variable ACLOCAL_PATH

 That can actually be considered a good thing. If the user has set ACLOCAL_PATH,
we really do want to override it (we don't want to rely on anything from the host).

> and no other package exports variables.

 Packages per se, indeed no, but this stuff can actually be considered part of
the infrastructure. They could just as well be defined in package/Makefile.in or
package/pkg-autotools.mk.

 A bunch of files are already exporting variables - particularly
package/pkg-download.mk.


 Regards,
 Arnout


> 
> -michael

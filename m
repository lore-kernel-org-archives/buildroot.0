From: Antoine Tenart <atenart@kernel.org>
Date: Thu, 11 Feb 2021 09:51:43 +0100
Subject: [Buildroot] [PATCH] package/refpolicy: do not use the bare
 target in the configuration step
In-Reply-To: <20210210204759.GD1679218@scaer>
References: <20210210185158.1254415-1-atenart@kernel.org>
 <20210210204759.GD1679218@scaer>
Message-ID: <161303350302.4159.3930376903227751717@kwain.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Quoting Yann E. MORIN (2021-02-10 21:47:59)
> On 2021-02-10 19:51 +0100, Antoine Tenart spake thusly:
> > The 'bare' target is a clean target, removing generated files from
> > previous builds. Here in Buildroot we'll only build the refpolicy from a
> > clean state and we don't need to execute this target. Remove it.
> 
> Will that still do correct builds with 'make refpolicy-rebuild' ?

I think you meant refpolicy-reconfigure, as I don't think rebuild will
call the configuration step again.

I double checked and there's an issue with an use case; the list of
modules to compile is not updated if a module is deleted (if added,
yes...). While we shouldn't expect much when deleting something from a
package (as the installation step will not clean what was installed
before), here, as we're explicitly using the monolithic build, removing
a module and reconfiguring should work. So let's be safe and keep this
as is.

Thanks!
Antoine

From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Mon, 27 Oct 2008 18:32:09 +0100
Subject: [Buildroot] Synchronisation of dependencies between Config.in
	and .mk files ?
In-Reply-To: <20081027175645.7e7cb096@surf>
References: <20081027175645.7e7cb096@surf>
Message-ID: <e4c675870810271032u4a2aff9fvb6e686ffb3f0fd31@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/27 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Hi,
>
> Currently, there are two complementary ways of expressing dependencies
> between packages:
>
>  * Through the select BR2_FOOBAR statements in the Config.in files ;
>

 Good: because we can see in the menuconfig what is selected immediately
 Bad: because once we remove the initial package we still stay with dependencies

>  * Through the FOOBAR_DEPS variable in the package makefiles.
>


 Bad: because these dependencies are not displayed into menuconfig
 Bad: because these dependencies would not be downloaded in 'make
sources' <--- !!!
 Good: because these dependencies are necessary for building


> The second one is absolutely necessary, as it makes sure that packages
> are built in the proper order. The first one allows packages Makefiles
> to adapt their configuration depending on the existing dependencies
> (i.e if tslib is available, then enable support for touchscreens, etc.).
>
> However, there are great chances for these two lists of dependencies
> for each package to become unsynchronized.
>
> What's the policy about this ? What are the current techniques to keep
> them synchronized ?
>

  tristate,  where x means depend on something:

BR2_CIAO=y
BR2_CIAO=x
# BR2_CIAO is not set

 or

BR2_CIAO=y
# BR2_CIAO needed by BR2_PLUTO BR2_PAPERINO ...
# BR2_CIAO is not set

 'select' in Config.in should not exist and 'make' should generate at
run-time all 'x-select' constrains accordingly with dependencies in
package.mk

 Easy to say but...
 ;-)

 Cheers,
-- 
/roberto

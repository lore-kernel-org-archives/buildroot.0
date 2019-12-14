From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Dec 2019 23:10:43 +0100
Subject: [Buildroot] [PATCH 00/12] Ensure extractor dependencies are
 taken into account
In-Reply-To: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191214221043.GD19349@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-12-10 22:59 +0100, Thomas Petazzoni spake thusly:
> This series solves that by introducing an extractor-pkg-dependency
> that returns the list of packages that must be added to
> <pkg>_EXTRACT_DEPENDENCIES to extract the archive passed as
> argument. It is then used in package/pkg-generic.mk to replace the
> existing logic to calculate <pkg>_EXTRACT_DEPENDENCIES, and then in
> the several places where suitable-extractor was used to manually
> extract a tarball.

Here is a summarry of our little discussion on IRC:

  - the extract dependencies for the main _SOURCE are automatically
    computed by Buildroot, but not for the _EXTRA_DOWNLOADS, which is
    not very systematic;

  - practically 99% of EXTRA_DOWNLOADS that are compressed, will be
    extracted at build time; the cases for (e.g.) an .xz to be stored
    as-is on the target is expected to be very rare;

  - so we should change the logic in this way (basically):

    $(2)_EXTRACT_DEPENDENCIES = $(foreach URI,$($(2)_SOURCE) $($(2)_EXTRA_DOWNLOADS),$(call extractor-pkg-dependency,$(notdir $(URI))))

Regards,
Yann E. MORIN.

> We also rename extractor-dependency to extractor-system-dependency to
> clarify its difference from extractor-pkg-dependency, and we rework
> the implementation of extractor-system-dependency.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

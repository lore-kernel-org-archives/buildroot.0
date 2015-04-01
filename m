From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Apr 2015 22:52:35 +0200
Subject: [Buildroot] [PATCH 0/7 v4] support/download: be more aggressive
 on missing hashes (branch yem/dl-hash-2)
In-Reply-To: <20150401220801.19f6ed2f@free-electrons.com>
References: <cover.1427840060.git.yann.morin.1998@free.fr>
 <20150401220801.19f6ed2f@free-electrons.com>
Message-ID: <20150401205235.GC4235@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-01 22:08 +0200, Thomas Petazzoni spake thusly:
> On Wed,  1 Apr 2015 00:15:03 +0200, Yann E. MORIN wrote:
> > This series makes hashes mandatory when a .hash file exists.
[--SNIP--]
> I applied this and was going to push it, but I believe there's still a
> problem.
> 
> If I change strace.hash so that there is no hash matching the tarball
> name of strace, then I get two times the error:
> 
> $ make strace-extract
> ERROR: No hash found for strace-4.10.tar.xz
> ERROR: No hash found for strace-4.10.tar.xz
> package/pkg-generic.mk:73: recipe for target '/home/thomas/projets/buildroot/output/build/strace-4.10/.stamp_downloaded' failed
> 
> I haven't looked too deeply, but I believe it's because check-hash
> returns 3, so dl-wrapper exits with error code 1, which means that the
> pkg-download.mk logic concludes that the download from the upstream
> location has failed, so it retries with sources.buildroot.net, and the
> same thing happens.
> 
> Is this expected?

That's at least the result I expect, yes.

I know this might look weird, indeed. However, I did not find a
simple
way to avoid this.

The problem is that we have a biggish block of succesive
conditions in
package/pkg-download:

    define DOWNLOAD_INNER
        $(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
                case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
                        scp) $(call $(DL_MODE)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
                        *) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
                esac ; \
        fi ; \
        if test "$(BR2_PRIMARY_SITE_ONLY)" = "y" ; then \
                exit 1 ; \
        fi ; \
        if test -n "$(1)" ; then \
                if test -z "$($(PKG)_SITE_METHOD)" ; then \
                        scheme="$(call geturischeme,$(1))" ; \
                else \
                        scheme="$($(PKG)_SITE_METHOD)" ; \
                fi ; \
                case "$$scheme" in \
                        git) $($(DL_MODE)_GIT) && exit ;; \
                        svn) $($(DL_MODE)_SVN) && exit ;; \
                        cvs) $($(DL_MODE)_CVS) && exit ;; \
                        bzr) $($(DL_MODE)_BZR) && exit ;; \
                        file) $($(DL_MODE)_LOCALFILES) && exit ;; \
                        scp) $($(DL_MODE)_SCP) && exit ;; \
                        hg) $($(DL_MODE)_HG) && exit ;; \
                        *) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
                esac ; \
        fi ; \
        if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
                $(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE)/$(2),$(2)) && exit ; \
        fi ; \
        exit 1
    endef

So, we would need to catch missing-hash failure in:
  - primary site,
  - upstream loction,
  - backup site.

But catching missing-hash failure needs a bit of a convoluted script
syntax, something like:

    if $($(DL_MODE)_GIT); then \
        : success; \
        exit; \
    else \
        if [ ${?} -eq 1 ]; then \
            : normal failure; \
        else \
            : missing-hash failure; \
            exit 1; \
        fi; \
    fi

And repeat for all other download methods...

That's a bit cumbersome to write. Unless we introduce yet another macro
that expands this code.

Your opinion?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

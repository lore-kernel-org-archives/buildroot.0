From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 21 Dec 2017 07:00:40 +0200
Subject: [Buildroot] how to pass directory path to sed script
In-Reply-To: <CAPi4xiV8JLmssUyBbFg3G+LKAwH1vaOrA8Wq5u=rQegY=3e7oQ@mail.gmail.com>
References: <CAPi4xiV8JLmssUyBbFg3G+LKAwH1vaOrA8Wq5u=rQegY=3e7oQ@mail.gmail.com>
Message-ID: <20171221050040.ee74zhh6xyljuyy5@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

On Wed, Dec 20, 2017 at 02:19:42PM -0800, Sam wrote:
> I'm using Buildroot to cross-compile Linux for RPi3. I'm trying to add a
> new package called Netmap to my Buildroot packages. The problem is that
> there's a configure file in netmap src directory which contained a variable
> named BUILDDIR and its default value is $PWD. During the configuring
> process, it'll be  automatically configured to my buildroot root directory.
> So I wanna replace it with $(@D). The following is what was doing, I'm
> sorry for no mk file attached because my host machine is on Gentoo text
> mode console.
> 
> define NETMAP_BUILD_CMDS
>      NETMAP_CURRENT_DIR=$(sed -e 's/\//\\\//g' <<< "$(@D)")  ---- empty
>      NETMAP_CURRENT_DIR=$$(sed -e 's/\//\\\//g' <<< "$(@D)") ----
> commandline itself
>      sed -e 's/BUILDDIR=$$PWD/BUILDDIR=$(NETMAP_CURRENT_DIR)/g' -i
> $(@D)/LINUX/configure
>      ...
> endef

You can't use '/' as s command expressions delimiter since the 
$(NETMAP_CURRENT_DIR) make variable expansion includes '/'. Use some other 
character, '%' is a common choice. 

Consider also using $(SED). Grep for '\bSED\b' under package/ for many 
examples.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

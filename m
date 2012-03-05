From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 5 Mar 2012 11:42:29 +0200
Subject: [Buildroot] [PATCH 1/1] package: fix WGET download method
In-Reply-To: <da800fd2ac3ecc63622314e0b140573b05924d7a.1330939857.git.thomas.petazzoni@free-electrons.com>
References: <cover.1330939857.git.thomas.petazzoni@free-electrons.com>
 <da800fd2ac3ecc63622314e0b140573b05924d7a.1330939857.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20120305094229.GC28936@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Mar 05, 2012 at 10:31:05AM +0100, Thomas Petazzoni wrote:

[snip]

> +# Download a file using wget. Only download the file if it doesn't
> +# already exist in the download directory. If the download fails,
> +# remove the file (because wget -O creates a 0-byte file even if the
> +# download fails).
>  define DOWNLOAD_WGET
>  	test -e $(DL_DIR)/$(2) || \
> -	$(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1))/$(2)
> +	$(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1))/$(2) || \
> +	(rm $(DL_DIR)/$(2) ; exit 1)

'rm -f' may be better here, as wget might error out before creating any file, 
thus causing a spurious "No such file or directory" message.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

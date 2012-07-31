From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 31 Jul 2012 16:55:52 +0200
Subject: [Buildroot] Manual password entry for DOWNLOAD_SCP scheme
In-Reply-To: <BLU145-W4DD32AE633EE92CAAD36DD6C50@phx.gbl>
References: <BLU145-W509744A25C67F5562EF92D6C50@phx.gbl>
 <CAAXf6LUXNqAHCCLkkNDRO8AA79fzpp9xmQhBDZJWBXF0aNae5g@mail.gmail.com>
 <BLU145-W160B8971C18907119E0961D6C50@phx.gbl>
 <BLU145-W4DD32AE633EE92CAAD36DD6C50@phx.gbl>
Message-ID: <CAAXf6LVtNQuR0Loh0pTibdjQrnb-TkaMzjU0K3HOAxX5LkHGHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please keep the buildroot mailing list in copy of all mails.

On Tue, Jul 31, 2012 at 1:18 PM, Steve Goldberg
<indeliblesteve@hotmail.com> wrote:
> Thomas,
>
> Problem solved.  The DOWNLOAD_SCP requires two arguments, full path with
> filename and filename.
>
> Reading package/pkg-download.mk shows
>
> DOWNLOAD $(FOO_SITE),$(FOO_SOURCE)
>
> but scp seems to need
>
> DOWNLOAD $(FOO_SITE)/$(FOO_SOURCE), $(FOO_SOURCE)
>
[...]
> This is a summary of the ti-tools.mk.
>
> XDC_VERSION=3_16_01_27
> XDC_SITE=scp://host:/home/steve/TI_Tools
> XDC_SOURCE=xdctools_setuplinux_$(XDC_VERSION).bin
>
> $(DL_DIR)/$(XDC_SOURCE) :
>         $(call DOWNLOAD_SCP,$(XDC_SITE)/$(XDC_SOURCE))

Note that you should call DOWNLOAD instead of DOWNLOAD_SCP directly.
This will make sure to respect the primary site and other mechanisms
that are in place.

Best regards,
Thomas



> From: indeliblesteve at hotmail.com
> To: patrickdepinguin+buildroot at gmail.com
> Subject: RE: [Buildroot] Manual password entry for DOWNLOAD_SCP scheme
> Date: Tue, 31 Jul 2012 04:07:15 -0700
>
>
> Thomas,
>
>> <indeliblesteve@hotmail.com> wrote:
>> > I'm putting together a TI toolchain package but as some of the required
>> > packages are export controlled I need to host them on my institutional
>> > machine to control access. I think scp is the best choice for this but
>> > the
>> > scp scheme does not prompt for passwords and users who haven't setup
>> > public-key ssh access are unable to download the packages. Why does the
>> > DOWNLOAD_SCP scheme not prompt the user for a password?
>>
>> In my test, using scp as primary site, it does ask for a password if
>> one is required.
>> How have you configured the package? Have you specified a user?
>
> This is a summary of the ti-tools.mk.
>
> XDC_VERSION=3_16_01_27
> XDC_SITE=scp://host:/home/steve/TI_Tools
> XDC_SOURCE=xdctools_setuplinux_$(XDC_VERSION).bin
>
> $(DL_DIR)/$(XDC_SOURCE) :
>         $(call DOWNLOAD_SCP,$(XDC_SITE)/$(XDC_SOURCE))
>
>> Have you tried running scp manually? Is a password requested there? Is
>> the same command used as Buildroot does?
>
> Yes, I've manually run the scp command that is generated and it does prompt
> for a password.
>
> This is what buildroot generates.
>
> make -C /home/steve/plat/overo/src/buildroot O=/home/steve/plat/overo/.
> mkdir -p /home/steve/plat/overo/host/ti/tools
> test -e /home/isteve/plat/overo/download/ || scp
> 'host:/home/steve/TI_Tools/xdctools_setuplinux_3_16_01_27.bin'
> /home/isteve/plat/overo/download/
>
> manually running scp
> 'host:/home/steve/TI_Tools/xdctools_setuplinux_3_16_01_27.bin'
> /home/isteve/plat/overo/download/
> prompts me for password.  I do not specify username as scp assumes the
> username of the current user which is okay for my purposes.
>
> Thanks.
>
> Steve

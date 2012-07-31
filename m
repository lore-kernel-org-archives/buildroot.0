From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jul 2012 17:05:20 +0200
Subject: [Buildroot] Manual password entry for DOWNLOAD_SCP scheme
In-Reply-To: <CAAXf6LVtNQuR0Loh0pTibdjQrnb-TkaMzjU0K3HOAxX5LkHGHA@mail.gmail.com>
References: <BLU145-W509744A25C67F5562EF92D6C50@phx.gbl>
 <CAAXf6LUXNqAHCCLkkNDRO8AA79fzpp9xmQhBDZJWBXF0aNae5g@mail.gmail.com>
 <BLU145-W160B8971C18907119E0961D6C50@phx.gbl>
 <BLU145-W4DD32AE633EE92CAAD36DD6C50@phx.gbl>
 <CAAXf6LVtNQuR0Loh0pTibdjQrnb-TkaMzjU0K3HOAxX5LkHGHA@mail.gmail.com>
Message-ID: <5017F430.7020103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/31/12 16:55, Thomas De Schampheleire wrote:
> Please keep the buildroot mailing list in copy of all mails.
>
> On Tue, Jul 31, 2012 at 1:18 PM, Steve Goldberg
> <indeliblesteve@hotmail.com>  wrote:
>> Thomas,
>>
>> Problem solved.  The DOWNLOAD_SCP requires two arguments, full path with
>> filename and filename.
>>
>> Reading package/pkg-download.mk shows
>>
>> DOWNLOAD $(FOO_SITE),$(FOO_SOURCE)
>>
>> but scp seems to need
>>
>> DOWNLOAD $(FOO_SITE)/$(FOO_SOURCE), $(FOO_SOURCE)
>>
> [...]
>> This is a summary of the ti-tools.mk.
>>
>> XDC_VERSION=3_16_01_27
>> XDC_SITE=scp://host:/home/steve/TI_Tools
>> XDC_SOURCE=xdctools_setuplinux_$(XDC_VERSION).bin
>>
>> $(DL_DIR)/$(XDC_SOURCE) :
>>          $(call DOWNLOAD_SCP,$(XDC_SITE)/$(XDC_SOURCE))
>
> Note that you should call DOWNLOAD instead of DOWNLOAD_SCP directly.
> This will make sure to respect the primary site and other mechanisms
> that are in place.

  Moreover, you should use $(eval $(generic-package)) rather than manual
targets.  If necessary, you can define XDC_EXTRACT_COMMANDS to use a
custom extraction mechanism (i.e., running the .bin file).  But if you're
anyway keeping a local copy of the xdctools, you're better off extracting
it once and repacking it into a tar.bz2. Saves you a lot of pain figuring
out how to run the self-extractor non-interactively in a way that doesn't
mess up your home directory.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

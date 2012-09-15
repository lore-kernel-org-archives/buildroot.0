From: Belisko Marek <marek.belisko@gmail.com>
Date: Sat, 15 Sep 2012 21:34:25 +0200
Subject: [Buildroot] [PATCH] Download packages from github in tar.gz
 format instead git format.
In-Reply-To: <CAHXCMM++UpS2jPSMtPwWzLsCKCdJnSqPOzY7MG5XBN+UuZ7yGQ@mail.gmail.com>
References: <1347714423-13242-1-git-send-email-marek.belisko@open-nandra.com>
 <CAHXCMM++UpS2jPSMtPwWzLsCKCdJnSqPOzY7MG5XBN+UuZ7yGQ@mail.gmail.com>
Message-ID: <CAAfyv37JJ=mziFGm93XYqzXdr8gFwb3pnevGhBPMJnNp4YchxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 15, 2012 at 5:04 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Nack.
>
> Though github provides a "download" tab, with a button to directly
> download the source tarball,
> the generated tarball url does contain the beginning of the commit sha1.
> So, the download url cannot be easily resolved, at least the current
> download infrastructure does not support it.
I was too fast with this patch. I retest few packages and all was working so
realized everything can be converted.

I find a way how to get tar.gz from github but not sure if it will be accepted
when post a patch:

When define in mk file:
RASPBERRYPI_FIRMWARE_VERSION = d29291e3e7d90f0137a1416845c7569cf291255e
RASPBERRYPI_FIRMWARE_SOURCE =
raspberrypi-firmware-$(RASPBERRYPI_FIRMWARE_VERSION).tar.gz
RASPBERRYPI_FIRMWARE_SITE =
http://github.com/raspberrypi/firmware/tarball/master

It start downloading correct git sha1:

>>> raspberrypi-firmware d29291e3e7d90f0137a1416845c7569cf291255e Downloading
--2012-09-15 21:31:37--
http://github.com/raspberrypi/firmware/tarball/master/raspberrypi-firmware-d29291e3e7d90f0137a1416845c7569cf291255e.tar.gz
Resolving github.com (github.com)... 207.97.227.239
Connecting to github.com (github.com)|207.97.227.239|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://github.com/raspberrypi/firmware/tarball/master/raspberrypi-firmware-d29291e3e7d90f0137a1416845c7569cf291255e.tar.gz
[following]
--2012-09-15 21:31:37--
https://github.com/raspberrypi/firmware/tarball/master/raspberrypi-firmware-d29291e3e7d90f0137a1416845c7569cf291255e.tar.gz
Connecting to github.com (github.com)|207.97.227.239|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://nodeload.github.com/raspberrypi/firmware/tarball/master
[following]
--2012-09-15 21:31:38--
https://nodeload.github.com/raspberrypi/firmware/tarball/master
Resolving nodeload.github.com (nodeload.github.com)... 207.97.227.252
Connecting to nodeload.github.com
(nodeload.github.com)|207.97.227.252|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 102851634 (98M) [application/x-gzip]
Saving to: `/home/open-nandra/projects/buildroot-new/dl/raspberrypi-firmware-d29291e3e7d90f0137a1416845c7569cf291255e.tar.gz.tmp'

Can I use this method?

>
> To, use a fix url stating with "http://github.com/downloads/", the
> maintainers of a github project has to upload something.
>
> As ref, a thread also talking about github download urls:
> http://lists.busybox.net/pipermail/buildroot/2012-August/057570.html
>
>
> 2012/9/15 Marek Belisko <marek.belisko@open-nandra.com>:
>> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>> ---
>>  package/cpuload/cpuload.mk                       |    2 +-
>>  package/input-event-daemon/input-event-daemon.mk |    2 +-
>>  package/jsmin/jsmin.mk                           |    2 +-
>>  package/libiqrf/libiqrf.mk                       |    2 +-
>>  package/mtdev2tuio/mtdev2tuio.mk                 |    2 +-
>>  package/omap-u-boot-utils/omap-u-boot-utils.mk   |    2 +-
>>  package/socketcand/socketcand.mk                 |    2 +-
>>  package/ti-utils/ti-utils.mk                     |    2 +-
>>  package/tslib/tslib.mk                           |    2 +-
>>  package/yajl/yajl.mk                             |    2 +-
>>  10 files changed, 10 insertions(+), 10 deletions(-)
>
> BTW, in this list, only yajl does upload some material, but the
> tarball of the yajl version we use in BR in is not available for
> download on the download page... :(
>
> Regards,
>
> --
> Sam

Thanks,

mbe

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Sep 2012 22:32:18 +0200
Subject: [Buildroot] [PATCH] Download packages from github in tar.gz
 format instead git format.
In-Reply-To: <CAAfyv37JJ=mziFGm93XYqzXdr8gFwb3pnevGhBPMJnNp4YchxQ@mail.gmail.com>
References: <1347714423-13242-1-git-send-email-marek.belisko@open-nandra.com>
 <CAHXCMM++UpS2jPSMtPwWzLsCKCdJnSqPOzY7MG5XBN+UuZ7yGQ@mail.gmail.com>
 <CAAfyv37JJ=mziFGm93XYqzXdr8gFwb3pnevGhBPMJnNp4YchxQ@mail.gmail.com>
Message-ID: <CAHXCMMKRxYA8yT+-9mjqzuM6mibPC8yjy5ZiGyfySFq+hQnBAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marek, all,

2012/9/15 Belisko Marek <marek.belisko@gmail.com>:
> On Sat, Sep 15, 2012 at 5:04 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> Nack.
>>
>> Though github provides a "download" tab, with a button to directly
>> download the source tarball,
>> the generated tarball url does contain the beginning of the commit sha1.
>> So, the download url cannot be easily resolved, at least the current
>> download infrastructure does not support it.
> I was too fast with this patch. I retest few packages and all was working so
> realized everything can be converted.
>
> I find a way how to get tar.gz from github but not sure if it will be accepted
> when post a patch:
>
> When define in mk file:
> RASPBERRYPI_FIRMWARE_VERSION = d29291e3e7d90f0137a1416845c7569cf291255e
> RASPBERRYPI_FIRMWARE_SOURCE =
> raspberrypi-firmware-$(RASPBERRYPI_FIRMWARE_VERSION).tar.gz
> RASPBERRYPI_FIRMWARE_SITE =
> http://github.com/raspberrypi/firmware/tarball/master
>
> It start downloading correct git sha1:
>
>>>> raspberrypi-firmware d29291e3e7d90f0137a1416845c7569cf291255e Downloading
> --2012-09-15 21:31:37--
> http://github.com/raspberrypi/firmware/tarball/master/raspberrypi-firmware-d29291e3e7d90f0137a1416845c7569cf291255e.tar.gz
> Resolving github.com (github.com)... 207.97.227.239
> Connecting to github.com (github.com)|207.97.227.239|:80... connected.
> HTTP request sent, awaiting response... 301 Moved Permanently
> Location: https://github.com/raspberrypi/firmware/tarball/master/raspberrypi-firmware-d29291e3e7d90f0137a1416845c7569cf291255e.tar.gz
> [following]
> --2012-09-15 21:31:37--
> https://github.com/raspberrypi/firmware/tarball/master/raspberrypi-firmware-d29291e3e7d90f0137a1416845c7569cf291255e.tar.gz
> Connecting to github.com (github.com)|207.97.227.239|:443... connected.
> HTTP request sent, awaiting response... 302 Found
> Location: https://nodeload.github.com/raspberrypi/firmware/tarball/master
> [following]
> --2012-09-15 21:31:38--
> https://nodeload.github.com/raspberrypi/firmware/tarball/master
> Resolving nodeload.github.com (nodeload.github.com)... 207.97.227.252
> Connecting to nodeload.github.com
> (nodeload.github.com)|207.97.227.252|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 102851634 (98M) [application/x-gzip]
> Saving to: `/home/open-nandra/projects/buildroot-new/dl/raspberrypi-firmware-d29291e3e7d90f0137a1416845c7569cf291255e.tar.gz.tmp'
>
> Can I use this method?

Of course you can! :-)


BTW, quick tests show that the beginning of the sha1 is enough for
github to match the revision you want to download, as well as
prefixing the sha1 with 'g'.
So, for example, it could be:
RASPBERRYPI_FIRMWARE_VERSION = d29291e
RASPBERRYPI_FIRMWARE_SOURCE =
raspberrypi-firmware-g$(RASPBERRYPI_FIRMWARE_VERSION).tar.gz
or:
RASPBERRYPI_FIRMWARE_VERSION = d29291e
RASPBERRYPI_FIRMWARE_SOURCE =
raspberrypi-firmware-$(RASPBERRYPI_FIRMWARE_VERSION).tar.gz

IMO, this is the way to go for non-tagged version.

For tagged version, the following seems working fine (to be confirmed):
CPULOAD_VERSION = v0.3
CPULOAD_SOURCE = kelvincheung-cpuload-$(CPULOAD_VERSION).tar.gz
CPULOAD_SITE = http://github.com/kelvincheung/cpuload/$(CPULOAD_VERSION)

If it is confirmed that this works, I'll definitely believe that's the
way to go ;-)

Care to give a try and resend a proper patch?
And, don't hesitate to add some note in the doc about how to form
*_SITE and *_SOURCE variables for github hosted projects.


Cheers,

-- 
Sam

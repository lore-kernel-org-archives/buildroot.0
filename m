From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sun, 20 Dec 2015 00:42:29 +0200 (IST)
Subject: [Buildroot] [PATCH 1/1] INSTALL for autotools packages with
 hardcoded '-s'
In-Reply-To: <20151219140242.588c12ba@free-electrons.com>
References: <1448206276-6260-1-git-send-email-yba@tkos.co.il>
 <20151219140242.588c12ba@free-electrons.com>
Message-ID: <alpine.DEB.2.11.1512192358590.2273@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Summary: This patch is apparently no longer required.

The patch that I submitted seems to be the only way to fix the older 
autotools packages that have this problem with the hardcoded '-s'. I don't 
think that there is another solution that is simpler or cleaner.

I submitted the patch in preparation for the ypbind-mt and yp-tools 
packages that I made using the old tarfiles on 
https://www.kernel.org/pub/linux/utils/net/NIS/. I had assumed that the 
presence of these tarballs on linux.org implied that they were the package
versions that are blessed for use with Linux when in fact they appear to 
have been left on kernel.org there for the archeologists. Baruch pointed 
out to me what I had refused to believe beforehand, that the NIS upstream 
really is https://github.com/thkukuk.

The latest tagged commits for yp-tools and ypbind mount on 
https://github.com/thkukuk have updated autotools configuration that do 
not require this '-s' patch. I built them last week for ARM using GCC 5.2 
with built-in RPC and encountered a -Wcast-align bug for which I 
submitted a patch to Thorsten and which I included in my Buildroot 
ypbind-mt package (not yet submitted to this list) until the patch is 
accepted by Thorsten.

At this point what remains to do is for me to build and test autofs, 
and the newer yp-tools and ypbind-mt packages using the toolchain without 
RPC that you sent me and to verify that tirpc builds and works. I hope to 
finish this coming week. In the meantime the client who ordered the work 
is using the rootfs with the older versions of yp-tools and ypbind-mt that 
I built last month which seem to work just fine for his application.

Thanks,

  - yba


On Sat, 19 Dec 2015, Thomas Petazzoni wrote:

> Date: Sat, 19 Dec 2015 14:02:42 +0100
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 1/1] INSTALL for autotools packages with
>     hardcoded '-s'
> 
> Jonathan,
>
> On Sun, 22 Nov 2015 17:31:16 +0200, Jonathan Ben-Avraham wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> The Makefile.in's of some autotools packages such as yp-tools and ypbind-mt do
>> not use the "install-sh" script for installing executables but instead call the
>> detected BSD compatible 'install' binary directly with hardcoded '-s' parameter.
>> This results in a build failure when the host 'strip' is invoked on binaries
>> compiled for a different arch. The 'install-without-strip' script removes the
>> '-s' parameter and execs the 'install' binary in PATH to solve this problem.
>> These autotools packages can then be build under Buildroot by specifying
>> <package>_CONF_ENV = INSTALL=support/scripts/install-without-strip
>>
>> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
>> ---
>>  support/scripts/install-without-strip |   11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>  create mode 100755 support/scripts/install-without-strip
>
> Following the feedback and discussion with Yann, I've marked this patch
> as Changes Requested in our patch tracking system. I guess we will see
> what the proper solution for the problem will be when you submit the
> packages affected by the 'install -s' problem.
>
> Best regards,
>
> Thomas
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm

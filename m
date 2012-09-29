From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Sep 2012 09:53:48 -0300
Subject: [Buildroot] [PATCHv3 1/4] pkgconf: new package
In-Reply-To: <50640642.8020407@mind.be>
References: <1348656857-27725-1-git-send-email-gustavo@zacarias.com.ar>
 <50640642.8020407@mind.be>
Message-ID: <5066EF5C.4030802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/27/12 04:54, Arnout Vandecappelle wrote:
>> +PKG_CONFIG_PATH=${PKG_CONFIG_PATH:- at PKG_CONFIG_PATH@}
>> PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@}
>> @HOST_DIR@/usr/bin/pkgconf $@
> 
>  Actually, instead of @HOST_DIR@/usr/bin, it's better to use $(dirname $0).
> That way it's relocatable.

Yes, that's cool.
I'm rolling back to not allowing overrides to PKG_CONFIG_PATH and
PKG_CONFIG_SYSROOT_DIR since at least one package (sshfs) behaves badly.
Case in point is it does export
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH which you can
guess where it goes.
I could append instead of replace, but again, in general for the time
being i see no real benefit in allowing it, so we'd end with:

PKG_CONFIG_PATH=@PKG_CONFIG_PATH@ PKG_CONFIG_SYSROOT_DIR=@STAGING_DIR@
$(dirname $0)/pkgconf $@

Like in v1 but with your dirname recommendation.
The other fix scenario would be to make all the packages use
$(TARGET_MAKE_ENV) and fill the PKG_CONFIG* variables there.
Regards.

From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jul 2016 11:56:59 +0200
Subject: [Buildroot] Python distutils.sysconfig values
In-Reply-To: <5774F565.1070603@gmail.com>
References: <5774F565.1070603@gmail.com>
Message-ID: <e03815f5-a875-13f8-2c70-7ecf448a7c9b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-06-16 12:33, Zoltan Gyarmati wrote:
> Dear All,
> 
> i'm trying to enable the gpsd python module in Buildroot (currently it's
> disabled, see package/gpsd/gpsd.mk line #25). The gpsd build system uses
> scons, which in turn uses distutils.sysconfig to get the value of
> various paramaters (like the compiler to use, etc) like this:
> 
>> vars = sysconfig.get_config_vars('CC', 'CXX', 'OPT', 'BASECFLAGS', 'CCSHARED', 'LDSHARED', 'SO', 'INCLUDEPY', 'LDFLAGS')
> 
> which apparently yields the following values:
> 
>> ['/usr/bin/gcc -pthread', '/usr/bin/g++ -pthread', '-DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes', '-fno-strict-aliasing', '-fPIC', '/usr/bin/gcc -pthread -shared -L/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/lib -L/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/usr/lib -Wl,-rpath,/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/usr/lib -Wl,--enable-new-dtags', '.so', '/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/usr/include/python2.7', '-L/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/lib -L/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/usr/lib -Wl,-rpath,/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/usr/lib -Wl,--enable-new-dtags']
> 
> 
>  Note that some of the variables related to the BR environment (like the
> python include dir), while others (most importantly CC) are coming from
> the host environment.
>  Does anybody could offer a hint where to look to get
> distutils.sysconfig to set all of these values correctly?

 You need to pass $(TARGET_CONFIGURE_OPTS) in the environment to set everything
correctly. gpsd does this:

GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

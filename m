From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 17 Feb 2016 11:03:56 +0100
Subject: [Buildroot] [PATCH v2 1/2] libimxvpuapi: add new package
In-Reply-To: <trinity-cadde813-570a-4e7a-b943-d69330bfa040-1455702340920@3capp-gmx-bs24>
References: <1454363759-23349-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454363759-23349-2-git-send-email-gary.bisson@boundarydevices.com>
 <20160216215313.15f228fe@gmx.net>
 <CAAMH-yuzsvt-6U-JX7RhNoEcWoJA4ahRm4U27LvWLwXyg4UtTg@mail.gmail.com>
 <trinity-cadde813-570a-4e7a-b943-d69330bfa040-1455702340920@3capp-gmx-bs24>
Message-ID: <CAAMH-yubfZANge5szjacoFEKK9dZQCFray18bYfnc75FSZ149w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Feb 17, 2016 at 10:45 AM, Peter Seiderer <ps.report@gmx.net> wrote:
> <snip>
>> Could you pastebin the full log of libimxvpuapi build, your buildroot
>> configuration as well as you 'env'?
>>
>
> Build log attached (rm -r build/libimxvpuapi-0.10.1; make V=1 2>&1 | tee out_build_libimxvpuapi_orig.txt),
> same buildroot setup as in previous e-mail: out_build_libimxvpuapi_orig.txt
>
> $ cd build/libimxvpuapi-0.10.1/
> $ /home/seiderer/Work/BD_Nitrogen6x/Buildroot-2016-02/build_2016_02_001/host/usr/bin/python2 ./waf configure --help
> ...
>     --libdir=LIBDIR     object code libraries [EXEC_PREFIX/lib64]

Thanks for your quick reply. Indeed the same command on my platform gives me:
    --libdir=LIBDIR     object code libraries [EXEC_PREFIX/lib]

Plus your env seems just fine. Digging into it I've found my the
difference is between our system, multiarch is enabled on mine. In the
Configure.py script the libdir is initialized as follows:
if not env.LIBDIR:
  if Options.options.libdir:
    env.LIBDIR=Utils.sane_path(Options.options.libdir)
  else:
    env.LIBDIR=Utils.subst_vars('${PREFIX}/lib%s'%Utils.lib64(),env)

And Utils.py tells us where the 64 comes from:
def lib64():
  if os.sep=='/':
    if platform.architecture()[0]=='64bit':
      if os.path.exists('/usr/lib64')and not os.path.exists('/usr/lib32'):
        return'64'
  return''

So I'll submit the v3 today and cc you. Thanks for reporting and
fixing the issue!

Regards,
Gary

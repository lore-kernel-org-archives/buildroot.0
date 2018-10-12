From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 13 Oct 2018 00:07:16 +0200
Subject: [Buildroot] [PATCH 3/6] package/qt5: prepare for per-version
 hash files
In-Reply-To: <20181012154653.GB31509@scaer>
References: <cover.1538913431.git.yann.morin.1998@free.fr>
 <cb17b9830b43b22d08ed65f5252a036f9ca3a94d.1538913431.git.yann.morin.1998@free.fr>
 <12e99890-01c9-4a50-9276-b99815b90b71@lucaceresoli.net>
 <20181012154653.GB31509@scaer>
Message-ID: <49cfb8fd-924b-f1e9-8524-3aae0055f4e9@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 12/10/2018 17:46, Yann E. MORIN wrote:
> Lucal, All,
> 
> On 2018-10-12 09:12 +0200, Luca Ceresoli spake thusly:
>> On 07/10/2018 13:57, Yann E. MORIN wrote:
>>> The Qt5 packages may have different licensing terms between the two
>>> versions we support, and in some cases, those different terms are
>>> expressed in similarly named files, like files named plain 'LICENSE' for
>>> example. This is problematic, because, in a .hash file, we can't store
>>> two different hashes for the same file.
>>>
>>> We've started to handle this case by moving the licenses hashes to the
>>> per-version sub directories.
>>>
>>> However, the hashes for the downloads are still stored inside the non-
>>> versioned hash file of the package, which is not totally coherent: if we
>>> have a per-version hash file, it should list all the hases for that
>>> version, downloads included, and there should be no unversioned hash
>>> file.
>>>
>>> In preparation for this, we duplicate the downloads hashes from the main
>>> hash files, and into the versioned ones. Once the download infra learns
>>> to look for those hashes in these per-version subdirs, we'll remove the
>>> unversioned hash files.
> [--SNIP--]
>>> diff --git a/package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash
>>> new file mode 100644
>>> index 0000000000..bdf844eb91
>>> --- /dev/null
>>> +++ b/package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash
>>> @@ -0,0 +1,7 @@
>>> +# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtquickcontrols2-everywhere-src-5.11.2.tar.xz.mirrorlist
>>> +sha256 aa0549f9a4135f9d600b57f53347ebf344e60d21f90c6d844109755da12dcb84 qtquickcontrols2-everywhere-src-5.11.2.tar.xz
>>> +
>>> +# Hashes for license files:
>>> +sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
>>> +sha256 9e63a04ce021b8bf811b30881fa51c8c3db88afeead942cd59322f2fb69c75bc LICENSE.LGPLv3
>>> +sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
> [--SNIP--]
>>> diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
>>> index 1ebed34166..eb97371337 100644
>>> --- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
>>> +++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
>>> @@ -3,8 +3,3 @@ sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickc
>>>  
>>>  # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtquickcontrols2-everywhere-src-5.11.2.tar.xz.mirrorlist
>>>  sha256 aa0549f9a4135f9d600b57f53347ebf344e60d21f90c6d844109755da12dcb84 qtquickcontrols2-everywhere-src-5.11.2.tar.xz
>>> -
>>> -# Hashes for license files:
>>> -sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
>>> -sha256 9e63a04ce021b8bf811b30881fa51c8c3db88afeead942cd59322f2fb69c75bc LICENSE.LGPLv3
>>> -sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
>>
>> Shouldn't this removal happen in patch 5?
> 
> Notice how we create the .hash file for the 5.11.2 version? This means
> that the hash-check for license files will be using it rather than the
> main hash file.
> 
> So, the hashes for the license of the 5.11.2 version are no longer
> usefull in the main hash file, ergo they get removed.

So this is a bit different from what you do to qt5base and
qt5virtualkeyboard. For those you leave the license hashes both in the
versioned files and the unversioned files.

However this difference has no practical effect since after patch 3
there are versioned hashes for all versions, thus the unversioned file
is ignored. Patch 5 will trim all the unused lines anyway, so I'm OK if
this is committed as-is.

Bye,
-- 
Luca

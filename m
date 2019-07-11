From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 11 Jul 2019 23:38:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-numpy: bump to version
 1.16.2
In-Reply-To: <20190317111424.2a66d695@windsurf>
References: <20190316114943.14110-1-fontaine.fabrice@gmail.com>
 <20190317111424.2a66d695@windsurf>
Message-ID: <dca94a6d-efeb-9581-8f06-5033b50b7dcd@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 17/03/2019 ? 11:14, Thomas Petazzoni a ?crit?:
> On Sat, 16 Mar 2019 12:49:43 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> - Update patches and send them upstream
>> - Update license hash (typos fixed and year updated)
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>  .../0001-Don-t-use-fenv.h-on-uClibc.patch          | 30 +++++++++++++
>>  package/python-numpy/0001-no-fenv-on-uclibc.patch  | 49 ----------------------
>>  ...2-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch | 31 ++++++++++++++
>>  .../0003-no-FPU-exceptions-bits-on-ARC-glibc.patch | 42 -------------------
>>  package/python-numpy/python-numpy.hash             |  6 +--
>>  package/python-numpy/python-numpy.mk               |  2 +-
>>  6 files changed, 65 insertions(+), 95 deletions(-)
>>  create mode 100644 package/python-numpy/0001-Don-t-use-fenv.h-on-uClibc.patch

This patch break python-numpy at runtime see [1] since it now require fenv.h [2].

Alpine Linux (and other musl c library distros) support
-------------------------------------------------------
We now default to use `fenv.h` for floating point status error reporting.
Previously we had a broken default that sometimes would not report underflow,
overflow, and invalid floating point operations. Now we can support non-glibc
distrubutions like Alpine Linux as long as they ship `fenv.h`.

With patch 0001 applied some floating point status function are missing:

 * Define floating point status functions. We must define
 * npy_get_floatstatus_barrier, npy_clear_floatstatus_barrier,
 * npy_set_floatstatus_{divbyzero, overflow, underflow, invalid}
 * for all supported platforms.

I believe we should disable python-numpy for uClibc since it doesn't provide fenv.h

[1] http://patchwork.ozlabs.org/patch/1112759
[2] https://github.com/numpy/numpy/commit/367f05a9d0bab03efc9dc394f0019ea6490e81a5

Best regards,
Romain

>>  delete mode 100644 package/python-numpy/0001-no-fenv-on-uclibc.patch
>>  create mode 100644 package/python-numpy/0002-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch
>>  delete mode 100644 package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch
> 
> Applied to master, thanks.
> 
> Thomas
> 

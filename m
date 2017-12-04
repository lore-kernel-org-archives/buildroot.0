From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 4 Dec 2017 17:32:31 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: bump to version 20.0
In-Reply-To: <20171203105905.3bdd1dc9@windsurf.lan>
References: <20171130154202.437-1-johan.oudinet@gmail.com>
 <20171203105905.3bdd1dc9@windsurf.lan>
Message-ID: <CAJtjsKYbRp-NcBxLfc-Xner7TUQuA8i3EjuR0QXgq908+Nwt6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Dec 3, 2017 at 10:59 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 30 Nov 2017 16:42:02 +0100, Johan Oudinet wrote:
>> This change bumps the Erlang version from 19.3 to 20.0. As a new major
>> release, there are a few incompatibilities. Details are here:
>> http://www.erlang.org/news/114
>>
>> This should fix builds on ppc64le host machines:
>> http://autobuild.buildroot.net/results/407af9800313d4540643d7625e85acc0c2366892
>> http://autobuild.buildroot.net/results/2aca54ad48ecfd72242d97499e21a46c1b384b10
>>
>> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
>> ---
>>  package/erlang/erlang.hash | 4 ++--
>>  package/erlang/erlang.mk   | 4 ++--
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> This causes a bunch of build failures:
>
>   http://autobuild.buildroot.net/?reason=host-erlang-20.0
>
> Seems like host-zlib is needed.
>
> Could you have a look ?

When trying to reproduce this build failure on my machine, I
discovered an unrelated error in flann package:
ERROR: unsafe header/library path used in cross-compilation
'/usr/include/hdf5/serial'

I skipped this error by adding this to FLANN_CONF_OPTS:
-DCMAKE_DISABLE_FIND_PACKAGE_HDF5=TRUE

As far as I understand it, this HDF5 dependency from flann is only
here for testing purpose and can be disabled in buildroot build.
Should I send a patch?

Unfortunately, I failed to reproduce the build failure on erlang but
when looking at the log, it indeed failed to find libz even though the
configure above seems to find it:
checking for zlib 1.2.5 or higher... yes
checking for zlib inflateGetDictionary presence... checking for
library containing inflateGetDictionary... -lz

What bother me is that I can't find which changes from OTP 19.3 to OTP
20.0 could lead to this error.
Anyway, should I simply add host-zlib as an erlang dependency and see
if the next build would pass?

Best,
-- 
Johan

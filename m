From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 12 Jun 2020 17:55:17 +0300
Subject: [Buildroot] [PATCH 1/1] python-pybind: new package
In-Reply-To: <CAJe0E3dM513JW=UOo1NJ4CEwEcBE5BgBuGkfwdKZZmyc_6jbEw@mail.gmail.com>
References: <20200608213043.3443-1-guillaume.bressaix@gmail.com>
 <20200610225523.5bc2d13b@windsurf.home>
 <CALFsTFXhvaq-sgWkHEk=gzOQTgDjbhKzNwOTVfrBiTT1Hqq40Q@mail.gmail.com>
 <CAJe0E3dM513JW=UOo1NJ4CEwEcBE5BgBuGkfwdKZZmyc_6jbEw@mail.gmail.com>
Message-ID: <CALFsTFUv5=cD1DSgtWRV3r_wBtMe0qWu8hLJAfW=yhFdg4i-Ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Jun 12, 2020 at 10:43 AM Guillaume Bres
<guillaume.bressaix@gmail.com> wrote:
>
> Hello,
>
> If I understand correctly, this patch only covers the first use case (C++/Python). I only added this one because my following patch requires host-python-pybind, but I agree it certainly lacks a depends on !BR2_INSTALL_LIBSTDCPP. I'll wait for people's point of view before going any further anyway. If you agree on this, I will add the dependency and push a v2
>
This patch includes only the installation of pybind11 to the target -
which isn't worth much since it includes only headers. It should be
installed to the staging dir instead. As far as I understand, there's
no point in installing this package to the target at all.
In addition, pay attention you don't only need C++, but at least C++11.

> The other use case that people might need in the future, is not allowed at the moment until we unlock it with $(eval $(cmake-package)) but requires further work (I am also not familiar with cmake at the moment). Maybe you could proceed with adding the cmake support because you are knowledgeable and already got it working?
>
Actually, the cmake part is already implemented in the patch I sent in
the previous mail. Feel free to take any parts you need from it.

> One last question though: "For example, this project won't find pybind11 because it uses find_package(pybind11...)", so we should rename the package to python-pybind11? so we don't have any other problems when unlocking the cmake option. If you agree on that point, my v2 will be renamed to python-pybind11 & and I will also adapt my following work to this new name
>
Well, only when you wrote that I noticed the package is named
python-pybind on Buildroot, but the real package name is actually
pybind11. So yes, I think it should be changed to python-pybind11.

> Guillaume W. Bres
> Software engineer
> <guillaume.bressaix@gmail.com>
>
>
> Le jeu. 11 juin 2020 ? 20:14, Asaf Kahlon <asafka7@gmail.com> a ?crit :
>>
>> Hello,
>>
>> I'm not sure pybind11 is just a "regular" python package.
>> First, it needs C++11 so we have to make sure the toolchain supports
>> that in order to be able to actually compile the generated pybind11
>> code.
>> Secondly, the installation through setup.py just installs the pybind11
>> headers and it doesn't give any way for C++ projects to locate the
>> package. For example, this project won't find pybind11 because it uses
>> find_package(pybind11...) in it's CMakeLists.txt:
>> https://github.com/pybind/pybind11_json. The installation of pybind11
>> using CMake gives a solution to this problem.
>>
>> Those considerations have been taken into account in a previous patch
>> I sent to the mailing list few weeks ago:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20200513183903.8656-1-asafka7 at gmail.com/
>>
>> Regards,
>> Asaf.
Best regards,
Asaf.

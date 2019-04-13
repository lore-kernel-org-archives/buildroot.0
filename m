From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 13 Apr 2019 19:10:43 +0200
Subject: [Buildroot] [RFC] package/python-mako: build host-python-mako
 as python3 module for mesa3d build.
In-Reply-To: <20190413185407.7b474503@windsurf>
References: <20190413164606.25700-1-romain.naour@smile.fr>
 <20190413185407.7b474503@windsurf>
Message-ID: <6a05f40c-9aab-abf8-a5ab-960931c4897c@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 13/04/2019 ? 18:54, Thomas Petazzoni a ?crit?:
> Hello Romain,
> 
> On Sat, 13 Apr 2019 18:46:06 +0200
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>> But adding python3 on the target in order to have a python3 module
>> on the host is not nice.
>>
>> To build host-python-mako as python3 module we can add this line
>> in pyhon-mako package:
>> HOST_PYTHON_MAKO_NEEDS_HOST_PYTHON = python3
>>
>> But python mako is not available anymore for python2 interpreter.
>>
>> The problem is more global, how can we build the same python
>> module for python2 and/or python3 on the host ?
> 
> We can't :-)

My issue would be solved if we can do that :p

> 
>> Mako module is also used by gnuradio build system and building
>> this module for python3 for mesa3d can eventually break the build of
>> gnuradio when the python interpreter on the host is python2
>> (to be tested).
> 
> Indeed, your patch would break situations where mesa3d is enabled, but
> another package needs host-python-mako for python2 (and not python3).

Indeed it break gnuradio:

-- Configuring VOLK support...
-- Build type set to Release.
-- Found PythonInterp: output/host/bin/python2 (found suitable version "2.7.15",
minimum required is "2")
-- 
-- Python checking for python >= 2.7
-- Python checking for python >= 2.7 - found
-- 
-- Python checking for mako >= 0.4.2
-- Python checking for mako >= 0.4.2 - not found
-- 
-- Python checking for six - python 2 and 3 compatibility library
-- Python checking for six - python 2 and 3 compatibility library - found
CMake Error at volk/CMakeLists.txt:88 (message):
  Mako templates required to build VOLK

> 
> We solved this problem for python-setuptools by having
> host-python-setuptools and host-python3-setuptools as separate
> packages. It's not great, but we don't have any other good solution for
> this at the moment I believe.

The problem is that mesa3d is not a python package :)

See the check is mesa build system:
https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=mesa-19.0.2#n723

> 
> Alternatively, perhaps for host Python modules we should always install
> them for both host-python and host-python3 (if both are enabled, of
> course). The gotcha is that since we don't have any Config.in options
> for host packages, how can we know if host-python and/or host-python3
> are enabled ?

I don't know... I need to dig deeper into this issue ;)

Best regards,
Romain

> 
> Thomas
> 

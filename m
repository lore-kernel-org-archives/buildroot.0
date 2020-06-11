From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Thu, 11 Jun 2020 09:21:59 +0100
Subject: [Buildroot] [PATCH v2] package/libcamera: bump version to
 8823461
In-Reply-To: <20200611011647.27d9d262@gmx.net>
References: <20200610211811.17118-1-ps.report@gmx.net>
 <20200610233512.2cf87475@windsurf.home> <20200611011647.27d9d262@gmx.net>
Message-ID: <be04a74b-a17f-4e66-c037-47bcf51a5068@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Thomas,

On 11/06/2020 00:16, Peter Seiderer wrote:
> Hello Thomas,
> 
> On Wed, 10 Jun 2020 23:35:12 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>> On Wed, 10 Jun 2020 23:18:11 +0200
>> Peter Seiderer <ps.report@gmx.net> wrote:
>>
>>> - add host dependencies: openssl, pkgconf, pyhton3-pyyaml

s/pyhton3-pyyaml/python3-pyyaml/


>>> - add dependencies: boost, gnutls
>>
>> Nooooo, it really unconditionally needs boost and gnutls? Why so? This
>> really seems like an odd choice from upstream. Kieran, do you confirm
>> this is really what you guys are doing?
> 
> According to [1] (and tested) gnutls is required...

The module signing process requires openssl on the host to 'sign' the
IPA modules during the build process.

On the target, gnutls is used to validate and verify IPA modules as
having been built at the same time. If so, then those modules are
permitted to be included in the same process space as libcamera and are
'trusted'.

Otherwise - if they are 'external' modules, they are forced to be
external and run in the sand-box environment. If gnutls is not
available, the module signing process will declare all modules to be
'untrusted'.



> The Boost dependency is only needed for the raspberrypi part and can
> be avoided by adding 'LIBCAMERA_CONF_OPTS += Dpipelines=ipu3,rkisp1,simple,uvcvideo,vimc'
> (all but raspberrypi)

Boost is unfortunate at the moment, and indeed is required to build the
RPi IPA.

Technically it only uses headers from boost I think for JSON parsing ...
and we do want to remove that dependency - as it ends up pulling in a
huge dependency for ... a very small part of that. :S

Ok - so grepping shows it uses the following headers:

 #include <boost/property_tree/ptree.hpp>
 #include <boost/property_tree/json_parser.hpp>
 #include <boost/any.hpp>


Anyone know if it's feasible to extract just the json_parser/ptree
headers from boost? I fear a never ending entanglement of required
headers if we tried to pull just those components out.

Hrm ... and std::any doesn't get in C++ until C++17 .. so we do still
need that one too ...



You could disable the RPi pipeline in buildroot, but I would expect that
RPi is probably the main target for anyone using buildroot to play with
libcamera at the moment ... (perhaps along with the rockchip targets)


We probably need to work on making the pipeline configurations smarter
to only build for the current architecture - but that should probably be
handled in libcamera. (with a compile test pipelines=all option).

--
Kieran



> Regards,
> Peter
> 
>>
>> Thomas

-- 
Regards
--
Kieran

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 16:09:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/openzwave: bump to
 62444b0f979c337d2091d77d89cf63c2ae9775cf
In-Reply-To: <20200328174404.1578918-1-fontaine.fabrice@gmail.com>
References: <20200328174404.1578918-1-fontaine.fabrice@gmail.com>
Message-ID: <20200329160946.706b8ae3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Mar 2020 18:44:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patches (already in version)
> - Current license files have been moved to licenses since
>   https://github.com/OpenZWave/open-zwave/commit/e5f22ed4aee753d7cbf20dc12859ec2c5bb2e974
> - Add new LICENSE file, available since
>   https://github.com/OpenZWave/open-zwave/commit/6e03f5fda0726cc449a902320dedf5838ea557d2
> - Update indentation of hash file (two spaces)
> - This bump is necessary to fix build with latest domoticz. Indeed, even
>   if this is a wrong practice, domoticz has a local copy of openzwave
>   headers which are now desynchronized from the openzwave source files

Arggh, this is horrible. Could you talk with the domoticz upstream
developers to tell them not to do that? It is really weird to link
against an external openzwave library, but use domoticz's copy of
openzwave headers.

But I see that's really what they are doing:

IF(OpenZWave)
  message(STATUS ${OpenZWave})
  target_link_libraries(domoticz ${OpenZWave})
  include_directories(${CMAKE_SOURCE_DIR}/hardware/openzwave)
  add_definitions(-DWITH_OPENZWAVE)
ELSE()

Also, another thing that is bad in domoticz:

IF(EXISTS /sys/class/gpio)
  message(STATUS "GPIO is available")
  add_definitions(-DWITH_GPIO)
ELSE()
  message(STATUS "GPIO is not available")
ENDIF()

So they check on the build machine if /sys/class/gpio exists to decide
whether to enable GPIO support...

Anyway, I've applied your openzwave patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

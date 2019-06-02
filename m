From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 2 Jun 2019 15:20:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/i2pd: fix static build with
 atomic
In-Reply-To: <20190531212946.75199930@windsurf>
References: <20190530213022.3878-1-fontaine.fabrice@gmail.com>
 <20190531164042.49667958@windsurf>
 <CAPi7W81OFgz-a8_Fjdvi_LrfwgkWs3KnO6MV=SAVpGjpXdjaSQ@mail.gmail.com>
 <20190531212946.75199930@windsurf>
Message-ID: <b466be9d-176f-d1ac-4f1e-c80d1c0bf37b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/05/2019 21:29, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 31 May 2019 16:54:15 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>>> It would be nice to not introduce a third way of doing the same
>>> thing :-)  
>> I know but in this case, this is the only solution that does not
>> impact upstream.
>> upstream choose to link through
>> target_link_libraries( "${PROJECT_NAME}" libi2pd libi2pdclient
>> ${DL_LIB} ${Boost_LIBRARIES} ${OPENSSL_LIBRARIES} ${ZLIB_LIBRARY}
>> ${CMAKE_THREAD_LIBS_INIT} ${MINGW_EXTRA} ${DL_LIB}
>> ${CMAKE_REQUIRED_LIBRARIES})
>>
>> Because of this, if we pass -latomic through CMAKE_EXE_LINKER_FLAGS or
>> CMAKE_CXX_FLAGS, it'll always be placed before Boost_Libraries and all
>> the other dependencies.
>> I can try to find a way to fix this but I didn't take time to do so as
>> it was quicker to just use CMAKE_REQUIRED_LIBRARIES.
> 
> Shouldn't we find a canonical way of adding the -latomic dependency
> handling directly in the CMakeLists.txt files of all those packages ?
> Ultimately, this should be the right thing to do, no ?

 I won't comment (yet) about how we should do it in Buildroot, but I think the
proper way to do this in CMake itself would be something like:

target_link_libraries(<target> PUBLIC atomic)

 The PUBLIC bit makes sure that the library is not just linked with, but that is
it also included in the generated .cmake file that is used by other packages to
find the include and libs options. As I mentioned earlier, though, I don't think
CMake has support for the equivalent of pkg-onfig Libs.private.

 For packages that provide a custom CMake config file, like boost, we could
update that config file and add something like:

set_property(TARGET <target> APPEND PROPERTY INTERFACE_LINK_LIBRARIES atomic)

 This gets complicated by three elements, though:
1. The boost cmake config files are generated.
2. There's also a boost library called 'atomic', it might clash.
3. For upstream boost, they'd want to detect the "must link with atomic" case
within their build system, probably.

 As to the cases we have already: CMAKE_EXE_LINKER_FLAGS is definitely more
appropriate than CMAKE_CXX_FLAGS.

 Regards,
 Arnout

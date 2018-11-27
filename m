From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Nov 2018 18:17:06 +0100
Subject: [Buildroot] [PATCH v2 2/2] grpc: new package
In-Reply-To: <20181118211942.28839-2-robertroyrose@gmail.com>
References: <20181118211942.28839-1-robertroyrose@gmail.com>
 <20181118211942.28839-2-robertroyrose@gmail.com>
Message-ID: <bf640496-1d99-e16b-020b-d60527a4faa1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Regarding the CMake issue that Thomas found...

On 18/11/2018 22:19, Robert Rose wrote:
> diff --git a/package/grpc/0001-target-build-using-host-plugin.patch b/package/grpc/0001-target-build-using-host-plugin.patch
> new file mode 100644
> index 0000000000..379464916a
> --- /dev/null
> +++ b/package/grpc/0001-target-build-using-host-plugin.patch
> @@ -0,0 +1,26 @@
> +From f7e70f03167834ce5e221c7dbca936edb1662274 Mon Sep 17 00:00:00 2001
> +From: Robert Rose <robertroyrose@gmail.com>
> +Date: Sun, 18 Nov 2018 12:55:49 -0800
> +Subject: [PATCH 1/1] target build using host plugin
> +
> +Signed-off-by: Robert Rose <robertroyrose@gmail.com>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index ab1802e..1b44c3c 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -199,7 +199,7 @@ function(protobuf_generate_grpc_cpp)
> +       COMMAND ${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}
> +       ARGS --grpc_out=generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}
> +            --cpp_out=${_gRPC_PROTO_GENS_DIR}
> +-           --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
> ++           --plugin=protoc-gen-grpc=$<IF:$<BOOL:${gRPC_NATIVE_CPP_PLUGIN}>,${gRPC_NATIVE_CPP_PLUGIN},$<TARGET_FILE:grpc_cpp_plugin>>

 The $<IF:...> generator was apparently introduced in CMake 3.8. So if you use
it, the patch should also update the minimal CMake version at the beginning of
the file, *and* the Buildroot minimum version should be updated from current 3.1
to 3.8 in support/dependencies/check-host-cmake.mk.

 Since that is not very nice, maybe a better alternative is to allow
grpc_cpp_plugin to be an imported target instead of an executable. That way you
can still simply use the $<TARGET_FILE> generator. Of course, importing a target
is a little bit more complicated...

 I think the latter would also be easier to accept for upstream.

> +            ${_protobuf_include_path}
> +            ${REL_FIL}
> +       DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
> +-- 
> +2.19.1
> +


 BTW, there's also a 1.16.1 release out.

 Regards,
 Arnout

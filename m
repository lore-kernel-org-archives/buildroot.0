From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 30 Apr 2019 23:14:28 +0200
Subject: [Buildroot] [RFC v2 6/7] package/mesa3d: switch build system to
 meson
In-Reply-To: <d5436033-635f-2d37-5ee6-1070895f6406@smile.fr>
References: <20190417214348.15685-1-romain.naour@smile.fr>
 <20190417214348.15685-6-romain.naour@smile.fr>
 <20190425225621.448aaaeb@gmx.net>
 <d5436033-635f-2d37-5ee6-1070895f6406@smile.fr>
Message-ID: <20190430231428.231ee566@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Tue, 30 Apr 2019 13:14:55 +0200, Romain Naour <romain.naour@smile.fr> wrote:

> Hi Peter, All
> 
> Le 25/04/2019 ? 22:56, Peter Seiderer a ?crit?:
> > Hello Bernd, Romain,
> >   
> 
> [...]
> 
> > 
> > Tested your patch series for i.mx6 (nitrogen6x_defconfig based), got the following
> > configure failure (see defconfig below):
> > 
> > [...]
> >   Host machine cpu family: arm
> >   Host machine cpu: cortex-a9
> >   Target machine cpu family: arm
> >   Target machine cpu: cortex-a9
> >   Build machine cpu family: x86_64
> >   Build machine cpu: x86_64
> > 
> >   meson.build:342:4: ERROR: Problem encountered: Cannot build GLX support without X11 platform support and at least one OpenGL API
> > 
> >   A full log can be found at .../build/mesa3d-19.0.2/build/meson-logs/meson-log.txt
> >   make[1]: *** [package/pkg-generic.mk:231: .../build/mesa3d-19.0.2/.stamp_configured]
> > 
> > The configure failure could be 'fixed' by the following quick patch:
> > 
> > diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> > index 5244545584..773defbfa1 100644
> > --- a/package/mesa3d/mesa3d.mk
> > +++ b/package/mesa3d/mesa3d.mk
> > @@ -153,7 +153,7 @@ endif
> > 
> >  # Always enable OpenGL:
> >  #   - it is needed for GLES (mesa3d's meson.build is a bit weird)
> > -MESA3D_CONF_OPTS += -Dopengl=true -Dglx=dri
> > +MESA3D_CONF_OPTS += -Dopengl=true  
> 
> Ack.
> Also, I'll replace -Dglx=auto by -Dglx=dri which is the only option that can be
> supported currently by the Buildroot package.
> All other options (xlib and xlib-gallium) are not supported by the current
> packaging.

So use the glx option only in case platform x11 is selected?

> 
> > 
> >  # libva and mesa3d have a circular dependency
> >  # we do not need libva support in mesa3d, therefore disable this option
> > 
> > 
> > With this patch applied the configure step succeeds, but the compile step
> > fails with:
> > 
> > [29/843] Generating vtn_gather_types.c with a custom command.
> > FAILED: src/compiler/spirv/vtn_gather_types.c
> > .../host/bin/python3 ../src/compiler/spirv/vtn_gather_types_c.py ../src/compiler/spirv/spirv.core.grammar.json src/compiler/spirv/vtn_gather_types.c
> > Traceback (most recent call last):
> >   File "../src/compiler/spirv/vtn_gather_types_c.py", line 29, in <module>
> >     from mako.template import Template
> > ModuleNotFoundError: No module named 'mako'
> > [30/843] Generating spirv_info.c with a custom command.
> > FAILED: src/compiler/spirv/spirv_info.c
> > .../host/bin/python3 ../src/compiler/spirv/spirv_info_c.py ../src/compiler/spirv/spirv.core.grammar.json src/compiler/spirv/spirv_info.c
> > Traceback (most recent call last):
> >   File "../src/compiler/spirv/spirv_info_c.py", line 29, in <module>
> >     from mako.template import Template
> > ModuleNotFoundError: No module named 'mako'
> > [35/843] Generating ir_expression_oper....h with a meson_exe.py custom command.
> > FAILED: src/compiler/ir_expression_operation.h
> > .../host/bin/meson --internal exe .../build/mesa3d-19.0.2/build/meson-private/meson_exe_python3_f99bf283dabcb83e5389be4bfb906240d67be6d7.dat
> > Traceback (most recent call last):
> >   File "../src/compiler/glsl/ir_expression_operation.py", line 23, in <module>
> >     import mako.template
> > ModuleNotFoundError: No module named 'mako'
> > [36/843] Generating nir_constant_expre....c with a meson_exe.py custom command.
> > FAILED: src/compiler/nir/nir_constant_expressions.c
> > .../host/bin/meson --internal exe .../build/mesa3d-19.0.2/build/meson-private/meson_exe_python3_16aba73c258f517db1423ca1fcbcc47a6f58541b.dat
> > Traceback (most recent call last):
> >   File "../src/compiler/nir/nir_constant_expressions.py", line 424, in <module>
> >     from mako.template import Template
> > ModuleNotFoundError: No module named 'mako'
> > [37/843] Generating nir_builder_opcodes.h with a meson_exe.py custom command.
> > FAILED: src/compiler/nir/nir_builder_opcodes.h
> > .../host/bin/meson --internal exe .../build/mesa3d-19.0.2/build/meson-private/meson_exe_python3_9519d8170e7bc8796b8caf294704c1ae9b9beb60.dat
> > Traceback (most recent call last):
> >   File "../src/compiler/nir/nir_builder_opcodes_h.py", line 98, in <module>
> >     from mako.template import Template
> > ModuleNotFoundError: No module named 'mako'
> > [38/843] Generating nir_opcodes.h with a meson_exe.py custom command.
> > FAILED: src/compiler/nir/nir_opcodes.h
> > .../host/bin/meson --internal exe .../build/mesa3d-19.0.2/build/meson-private/meson_exe_python3_7d8bc70fe02c4d6671c051c06b6c456b05bca90c.dat
> > Traceback (most recent call last):
> >   File "../src/compiler/nir/nir_opcodes_h.py", line 45, in <module>
> >     from mako.template import Template
> > ModuleNotFoundError: No module named 'mako'
> > [45/843] Generating format_srgb with a meson_exe.py custom command.
> > ninja: build stopped: subcommand failed.
> > make[1]: *** [package/pkg-generic.mk:241: .../build/mesa3d-19.0.2/.stamp_built] Error 1
> > 
> > 
> > Seems the patch 0002-meson-use-generated-files-if-already-present-in-the-.patch is
> > not enough to prevent all python-mako based file generation calls...  
> 
> Indeed, this doesn't work when some drivers (like etnaviv) are enabled.
> 
> I don't see other solution than adding a new package python3-mako like it was
> done for python3-setuptools.
> See: http://lists.busybox.net/pipermail/buildroot/2019-April/247707.html
> 
> It's pity that the meson build system can't use existing generated files present
> in the release archive.

Did a 'hack' patch to avoid file generation (not upstreamable, but for a first try):

diff --git a/package/mesa3d/0005-Fix-no-generated-files.patch b/package/mesa3d/0005-Fix-no-generated-files.patch
new file mode 100644
index 00000000..f28dfde8
--- /dev/null
+++ b/package/mesa3d/0005-Fix-no-generated-files.patch
@@ -0,0 +1,393 @@
+diff --git a/src/compiler/glsl/meson.build b/src/compiler/glsl/meson.build
+index 3b3ec27..33e8703 100644
+--- a/src/compiler/glsl/meson.build
++++ b/src/compiler/glsl/meson.build
+@@ -20,6 +20,8 @@
+ 
+ subdir('glcpp')
+ 
++prog_echo = find_program('echo')
++
+ glsl_parser = custom_target(
+   'glsl_parser',
+   input : 'glsl_parser.yy',
+@@ -38,19 +40,25 @@ glsl_lexer_cpp = custom_target(
+ )
+ 
+ ir_expression_operation_constant_h = custom_target(
+-  'ir_expression_operation_constant.h',
+-  input : 'ir_expression_operation.py',
+-  output : 'ir_expression_operation_constant.h',
+-  command : [prog_python, '@INPUT@', 'constant'],
++  'ir_expression_operation_constant.h_bla',
++#  input : 'ir_expression_operation.py',
++#  output : 'ir_expression_operation_constant.h',
++#  command : [prog_python, '@INPUT@', 'constant'],
++  input : files(),
++  output : 'ir_expression_operation_constant.h_bla',
++  command : [prog_echo],
+   capture : true,
+   build_always_stale : false,
+ )
+ 
+ ir_expression_operation_strings_h = custom_target(
+-  'ir_expression_operation_strings.h',
+-  input : 'ir_expression_operation.py',
++  'ir_expression_operation_strings.h_bla',
++#  input : 'ir_expression_operation.py',
++#  output : 'ir_expression_operation_strings.h',
++#  command : [prog_python, '@INPUT@', 'strings'],
++  input : files(),
+   output : 'ir_expression_operation_strings.h',
+-  command : [prog_python, '@INPUT@', 'strings'],
++  command : [prog_echo],
+   capture : true,
+   build_always_stale : false,
+ )
+diff --git a/src/compiler/meson.build b/src/compiler/meson.build
+index ff254b6..6debfb9 100644
+--- a/src/compiler/meson.build
++++ b/src/compiler/meson.build
+@@ -18,6 +18,8 @@
+ # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ # SOFTWARE.
+ 
++prog_echo = find_program('echo')
++
+ inc_compiler = include_directories('.')
+ inc_nir = include_directories('nir')
+ inc_glsl = include_directories('glsl')
+@@ -38,11 +40,14 @@ files_libcompiler = files(
+ 
+ ir_expression_operation_h = custom_target(
+   'ir_expression_operation.h',
+-  input : 'glsl/ir_expression_operation.py',
+-  output : 'ir_expression_operation.h',
+-  command : [prog_python, '@INPUT@', 'enum'],
++#  input : 'glsl/ir_expression_operation.py',
++#  output : 'ir_expression_operation.h',
++#  command : [prog_python, '@INPUT@', 'enum'],
+   capture : true,
+   build_always_stale : false,
++  input : files(),
++  output : 'ir_expression_operation.h',
++  command : [prog_echo],
+ )
+ 
+ libcompiler = static_library(
+diff --git a/src/compiler/nir/meson.build b/src/compiler/nir/meson.build
+index e6784fc..a6aedfb 100644
+--- a/src/compiler/nir/meson.build
++++ b/src/compiler/nir/meson.build
+@@ -18,70 +18,93 @@
+ # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ # SOFTWARE.
+ 
++prog_echo = find_program('echo')
++
+ nir_depends = files('nir_opcodes.py', 'nir_intrinsics.py')
+ 
+ nir_builder_opcodes_h = custom_target(
+   'nir_builder_opcodes.h',
+-  input : 'nir_builder_opcodes_h.py',
++#  input : 'nir_builder_opcodes_h.py',
++#  output : 'nir_builder_opcodes.h',
++#  command : [prog_python, '@INPUT@'],
++  input : files(),
+   output : 'nir_builder_opcodes.h',
+-  command : [prog_python, '@INPUT@'],
++  command : [prog_echo],
+   capture : true,
+-  depend_files : nir_depends,
++#  depend_files : nir_depends,
+ )
+ 
+-nir_constant_expressions_c = custom_target(
+-  'nir_constant_expressions.c',
+-  input : 'nir_constant_expressions.py',
+-  output : 'nir_constant_expressions.c',
+-  command : [prog_python, '@INPUT@'],
+-  capture : true,
+-  depend_files : nir_depends,
+-)
++#nir_constant_expressions_c = custom_target(
++#  'nir_constant_expressions.c',
++#  input : 'nir_constant_expressions.py',
++#  output : 'nir_constant_expressions.c',
++#  command : [prog_python, '@INPUT@'],
++#  input : files(),
++#  output : 'nir_constant_expressions.c',
++#  command : [prog_echo],
++#  capture : true,
++#  depend_files : nir_depends,
++#)
+ 
+ nir_opcodes_h = custom_target(
+   'nir_opcodes.h',
+-  input : 'nir_opcodes_h.py',
++#  input : 'nir_opcodes_h.py',
++#  output : 'nir_opcodes.h',
++#  command : [prog_python, '@INPUT@'],
++  input : files(),
+   output : 'nir_opcodes.h',
+-  command : [prog_python, '@INPUT@'],
++  command : [prog_echo],
+   capture : true,
+-  depend_files : nir_depends,
++#  depend_files : nir_depends,
+ )
+ 
+-nir_opcodes_c = custom_target(
+-  'nir_opcodes.c',
+-  input : 'nir_opcodes_c.py',
+-  output : 'nir_opcodes.c',
+-  command : [prog_python, '@INPUT@'],
+-  capture : true,
+-  depend_files : nir_depends,
+-)
++#nir_opcodes_c = custom_target(
++#  'nir_opcodes.c',
++#  input : 'nir_opcodes_c.py',
++#  output : 'nir_opcodes.c',
++#  command : [prog_python, '@INPUT@'],
++#  input : files(),
++#  output : 'nir_opcodes.c',
++#  command : [prog_echo],
++#  capture : true,
++#  depend_files : nir_depends,
++#)
+ 
+-nir_opt_algebraic_c = custom_target(
+-  'nir_opt_algebraic.c',
+-  input : 'nir_opt_algebraic.py',
+-  output : 'nir_opt_algebraic.c',
+-  command : [prog_python, '@INPUT@'],
+-  capture : true,
+-  depend_files : files('nir_algebraic.py'),
+-)
++#nir_opt_algebraic_c = custom_target(
++#  'nir_opt_algebraic.c',
++#  input : 'nir_opt_algebraic.py',
++#  output : 'nir_opt_algebraic.c',
++#  command : [prog_python, '@INPUT@'],
++#  input : files(),
++#  output : 'nir_opt_algebraic.c',
++#  command : [prog_echo],
++#  capture : true,
++#  depend_files : files('nir_algebraic.py'),
++#)
+ 
+ nir_intrinsics_h = custom_target(
+   'nir_intrinsics.h',
+-  input : 'nir_intrinsics_h.py',
++#  input : 'nir_intrinsics_h.py',
++#  output : 'nir_intrinsics.h',
++#  command : [prog_python, '@INPUT@', '--outdir', meson.current_build_dir()],
++  input : files(),
+   output : 'nir_intrinsics.h',
+-  command : [prog_python, '@INPUT@', '--outdir', meson.current_build_dir()],
++  command : [prog_echo],
+   capture : false,
+-  depend_files : files('nir_intrinsics.py'),
++#  depend_files : files('nir_intrinsics.py'),
+ )
+ 
+-nir_intrinsics_c = custom_target(
+-  'nir_intrinsic.c',
+-  input : 'nir_intrinsics_c.py',
+-  output : 'nir_intrinsics.c',
+-  command : [prog_python, '@INPUT@', '--outdir', meson.current_build_dir()],
+-  capture: false,
+-  depend_files : files('nir_intrinsics.py'),
+-)
++#nir_intrinsics_c = custom_target(
++#  'nir_intrinsics.c',
++#  input : 'nir_intrinsics_c.py',
++#  output : 'nir_intrinsics.c',
++#  command : [prog_python, '@INPUT@', '--outdir', meson.current_build_dir()],
++#  input : files(),
++#  output : 'nir_intrinsics.c',
++#  command : [prog_echo],
++#  capture: false,
++#  depend_files : files('nir_intrinsics.py'),
++#)
+ 
+ files_libnir = files(
+   'nir.c',
+@@ -91,6 +114,7 @@ files_libnir = files(
+   'nir_builtin_builder.h',
+   'nir_clone.c',
+   'nir_constant_expressions.h',
++  'nir_constant_expressions.c',
+   'nir_control_flow.c',
+   'nir_control_flow.h',
+   'nir_control_flow_private.h',
+@@ -105,6 +129,7 @@ files_libnir = files(
+   'nir_inline_functions.c',
+   'nir_instr_set.c',
+   'nir_instr_set.h',
++  'nir_intrinsics.c',
+   'nir_linking_helpers.c',
+   'nir_liveness.c',
+   'nir_loop_analyze.c',
+@@ -156,6 +181,8 @@ files_libnir = files(
+   'nir_move_load_const.c',
+   'nir_move_vec_src_uses_to_dest.c',
+   'nir_normalize_cubemap_coords.c',
++  'nir_opcodes.c',
++  'nir_opt_algebraic.c',
+   'nir_opt_conditional_discard.c',
+   'nir_opt_constant_folding.c',
+   'nir_opt_copy_prop_vars.c',
+@@ -206,11 +233,13 @@ files_libnir = files(
+   '../spirv/nir_spirv.h',
+   '../spirv/spirv.h',
+   '../spirv/spirv_info.h',
++  '../spirv/spirv_info.c',
+   '../spirv/spirv_to_nir.c',
+   '../spirv/vtn_alu.c',
+   '../spirv/vtn_amd.c',
+   '../spirv/vtn_cfg.c',
+   '../spirv/vtn_glsl450.c',
++  '../spirv/vtn_gather_types.c',
+   '../spirv/vtn_private.h',
+   '../spirv/vtn_subgroup.c',
+   '../spirv/vtn_variables.c',
+@@ -218,9 +247,12 @@ files_libnir = files(
+ 
+ libnir = static_library(
+   'nir',
+-  [files_libnir, spirv_info_c, nir_opt_algebraic_c, nir_opcodes_c,
+-   nir_opcodes_h, nir_constant_expressions_c, nir_builder_opcodes_h,
+-   vtn_gather_types_c, nir_intrinsics_c, nir_intrinsics_h],
++#  [files_libnir, spirv_info_c, nir_opt_algebraic_c, nir_opcodes_c,
++#   nir_opcodes_h, nir_constant_expressions_c, nir_builder_opcodes_h,
++#   vtn_gather_types_c, nir_intrinsics_c, nir_intrinsics_h],
++  [files_libnir,
++   nir_opcodes_h, nir_builder_opcodes_h,
++   nir_intrinsics_h],
+   include_directories : [inc_common, inc_compiler, include_directories('../spirv')],
+   c_args : [c_vis_args, c_msvc_compat_args, no_override_init_args],
+   link_with : libcompiler,
+diff --git a/src/compiler/spirv/meson.build b/src/compiler/spirv/meson.build
+index c91d12a..b0e6f1e 100644
+--- a/src/compiler/spirv/meson.build
++++ b/src/compiler/spirv/meson.build
+@@ -18,16 +18,24 @@
+ # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ # SOFTWARE.
+ 
+-vtn_gather_types_c = custom_target(
+-  'vtn_gather_types.c',
+-  input : files('vtn_gather_types_c.py', 'spirv.core.grammar.json'),
+-  output : 'vtn_gather_types.c',
+-  command : [prog_python, '@INPUT0@', '@INPUT1@', '@OUTPUT@'],
+-)
++prog_echo = find_program('echo')
+ 
+-spirv_info_c = custom_target(
+-  'spirv_info.c',
+-  input : files('spirv_info_c.py', 'spirv.core.grammar.json'),
+-  output : 'spirv_info.c',
+-  command : [prog_python, '@INPUT0@', '@INPUT1@', '@OUTPUT@'],
+-)
++#vtn_gather_types_c = custom_target(
++#  'vtn_gather_types.c_bla',
++#  input : files('vtn_gather_types_c.py', 'spirv.core.grammar.json'),
++#  output : 'vtn_gather_types.c',
++#  command : [prog_python, '@INPUT0@', '@INPUT1@', '@OUTPUT@'],
++#  input : files(),
++#  output : 'vtn_gather_types.c_bla',
++#  command : [prog_echo],
++#)
++
++#spirv_info_c = custom_target(
++#  'spirv_info.c',
++#  input : files('spirv_info_c.py', 'spirv.core.grammar.json'),
++#  output : 'spirv_info.c',
++#  command : [prog_python, '@INPUT0@', '@INPUT1@', '@OUTPUT@'],
++#  input : files(),
++#  output : 'spirv_info.c',
++#  command : [prog_echo],
++#)
+diff --git a/src/mesa/meson.build b/src/mesa/meson.build
+index 27c8c40..617f729 100644
+--- a/src/mesa/meson.build
++++ b/src/mesa/meson.build
+@@ -21,6 +21,8 @@
+ subdir('program')
+ subdir('main')
+ 
++prog_echo = find_program('echo')
++
+ # files shared between classic mesa and gallium mesa
+ files_libmesa_common = files(
+   'program/arbprogparse.c',
+@@ -663,13 +665,16 @@ elif with_asm_arch == 'sparc'
+   inc_libmesa_asm = include_directories('sparc')
+ endif
+ 
+-format_fallback_c = custom_target(
+-  'format_fallback.c',
+-  input : ['main/format_fallback.py', 'main/formats.csv'],
+-  output : 'format_fallback.c',
+-  command : [prog_python, '@INPUT0@', '@INPUT1@', '@OUTPUT@'],
+-  depend_files : files('main/format_parser.py'),
+-)
++#format_fallback_c = custom_target(
++#  'format_fallback.c',
++#  input : ['main/format_fallback.py', 'main/formats.csv'],
++#  output : 'format_fallback.c',
++#  command : [prog_python, '@INPUT0@', '@INPUT1@', '@OUTPUT@'],
++#  input : files(),
++#  output : 'format_fallback.c',
++#  command : [prog_echo],
++#  depend_files : files('main/format_parser.py'),
++#)
+ 
+ get_hash_h = custom_target(
+   'get_hash.h',
+@@ -680,25 +685,30 @@ get_hash_h = custom_target(
+   capture : true,
+ )
+ 
+-foreach x : [['format_info.h', 'format_info.py'],
+-             ['format_pack.c', 'format_pack.py'],
+-             ['format_unpack.c', 'format_unpack.py']]
+-  files_libmesa_common += custom_target(
+-    x[0],
+-    input : ['main/@0@'.format(x[1]), 'main/formats.csv'],
+-    output : x[0],
+-    command : [prog_python, '@INPUT0@', '@INPUT1@'],
+-    depend_files : files('main/format_parser.py'),
+-    capture : true,
+-  )
+-endforeach
++#foreach x : [['format_info.h', 'format_info.py'],
++#             ['format_pack.c', 'format_pack.py'],
++#             ['format_unpack.c', 'format_unpack.py']]
++#  files_libmesa_common += custom_target(
++#    x[0],
++#    input : ['main/@0@'.format(x[1]), 'main/formats.csv'],
++#    output : x[0],
++#    command : [prog_python, '@INPUT0@', '@INPUT1@'],
++#    depend_files : files('main/format_parser.py'),
++#    input : files(),
++#    output : x[0],
++#    command : [prog_echo],
++#    capture : true,
++#  )
++#endforeach
+ 
+ files_libmesa_common += [
+   mesa_lex,
+   program_parse_tab,
+   main_api_exec_c,
+   main_enums_c,
+-  format_fallback_c,
++  'main/format_fallback.c',
++  'main/format_pack.c',
++  'main/format_unpack.c',
+   get_hash_h,
+   main_marshal_generated_c,
+   main_marshal_generated_h,

Regards,
Peter

> 
> Best regards,
> Romain
> 
> > 
> > Regards,
> > Peter
> > 
> > BR2_arm=y
> > BR2_cortex_a9=y
> > BR2_ARM_ENABLE_NEON=y
> > BR2_ARM_ENABLE_VFP=y
> > BR2_ARM_FPU_VFPV3=y
> > BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> > BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> > BR2_BINUTILS_VERSION_2_32_X=y
> > BR2_GCC_VERSION_8_X=y
> > BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> > BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
> > BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
> > BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
> > BR2_LINUX_KERNEL=y
> > BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/2aef1ef6.tar.gz"
> > BR2_LINUX_KERNEL_DEFCONFIG="boundary"
> > BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6dl-nitrogen6_som2 imx6q-nitrogen6_som2 imx6qp-nitrogen6_som2 imx6q-nitrogen6_max imx6qp-nitrogen6_max imx6q-sabrelite"
> > BR2_LINUX_KERNEL_INSTALL_TARGET=y
> > BR2_PACKAGE_MESA3D=y
> > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
> > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
> > BR2_PACKAGE_MESA3D_OPENGL_ES=y
> > BR2_TARGET_ROOTFS_EXT2=y
> > BR2_TARGET_ROOTFS_EXT2_4=y
> > BR2_TARGET_UBOOT=y
> > BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> > BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1530219d.tar.gz"
> > BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6q"
> > BR2_TARGET_UBOOT_FORMAT_IMX=y
> > BR2_TARGET_UBOOT_BOOT_SCRIPT=y
> > BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
> > BR2_PACKAGE_HOST_GENIMAGE=y
> > BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> >   
> 

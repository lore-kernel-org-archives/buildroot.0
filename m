From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 6 May 2019 11:57:50 +0200
Subject: [Buildroot] [RFC v2 6/7] package/mesa3d: switch build system to
 meson
In-Reply-To: <20190430231428.231ee566@gmx.net>
References: <20190417214348.15685-1-romain.naour@smile.fr>
 <20190417214348.15685-6-romain.naour@smile.fr>
 <20190425225621.448aaaeb@gmx.net>
 <d5436033-635f-2d37-5ee6-1070895f6406@smile.fr>
 <20190430231428.231ee566@gmx.net>
Message-ID: <99f90f9b-2b60-b575-0bcc-8ea014bf1b11@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 30/04/2019 ? 23:14, Peter Seiderer a ?crit?:
> Hello Romain,
> 
> On Tue, 30 Apr 2019 13:14:55 +0200, Romain Naour <romain.naour@smile.fr> wrote:
> 
>> Hi Peter, All
>>
>> Le 25/04/2019 ? 22:56, Peter Seiderer a ?crit?:
>>> Hello Bernd, Romain,
>>>   
>>
>> [...]
>>
>>>
>>> Tested your patch series for i.mx6 (nitrogen6x_defconfig based), got the following
>>> configure failure (see defconfig below):
>>>
>>> [...]
>>>   Host machine cpu family: arm
>>>   Host machine cpu: cortex-a9
>>>   Target machine cpu family: arm
>>>   Target machine cpu: cortex-a9
>>>   Build machine cpu family: x86_64
>>>   Build machine cpu: x86_64
>>>
>>>   meson.build:342:4: ERROR: Problem encountered: Cannot build GLX support without X11 platform support and at least one OpenGL API
>>>
>>>   A full log can be found at .../build/mesa3d-19.0.2/build/meson-logs/meson-log.txt
>>>   make[1]: *** [package/pkg-generic.mk:231: .../build/mesa3d-19.0.2/.stamp_configured]
>>>
>>> The configure failure could be 'fixed' by the following quick patch:
>>>
>>> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
>>> index 5244545584..773defbfa1 100644
>>> --- a/package/mesa3d/mesa3d.mk
>>> +++ b/package/mesa3d/mesa3d.mk
>>> @@ -153,7 +153,7 @@ endif
>>>
>>>  # Always enable OpenGL:
>>>  #   - it is needed for GLES (mesa3d's meson.build is a bit weird)
>>> -MESA3D_CONF_OPTS += -Dopengl=true -Dglx=dri
>>> +MESA3D_CONF_OPTS += -Dopengl=true  
>>
>> Ack.
>> Also, I'll replace -Dglx=auto by -Dglx=dri which is the only option that can be
>> supported currently by the Buildroot package.
>> All other options (xlib and xlib-gallium) are not supported by the current
>> packaging.
> 
> So use the glx option only in case platform x11 is selected?
> 
>>
>>>
>>>  # libva and mesa3d have a circular dependency
>>>  # we do not need libva support in mesa3d, therefore disable this option
>>>
>>>
>>> With this patch applied the configure step succeeds, but the compile step
>>> fails with:
>>>
>>> [29/843] Generating vtn_gather_types.c with a custom command.
>>> FAILED: src/compiler/spirv/vtn_gather_types.c
>>> .../host/bin/python3 ../src/compiler/spirv/vtn_gather_types_c.py ../src/compiler/spirv/spirv.core.grammar.json src/compiler/spirv/vtn_gather_types.c
>>> Traceback (most recent call last):
>>>   File "../src/compiler/spirv/vtn_gather_types_c.py", line 29, in <module>
>>>     from mako.template import Template
>>> ModuleNotFoundError: No module named 'mako'
>>> [30/843] Generating spirv_info.c with a custom command.
>>> FAILED: src/compiler/spirv/spirv_info.c
>>> .../host/bin/python3 ../src/compiler/spirv/spirv_info_c.py ../src/compiler/spirv/spirv.core.grammar.json src/compiler/spirv/spirv_info.c
>>> Traceback (most recent call last):
>>>   File "../src/compiler/spirv/spirv_info_c.py", line 29, in <module>
>>>     from mako.template import Template
>>> ModuleNotFoundError: No module named 'mako'
>>> [35/843] Generating ir_expression_oper....h with a meson_exe.py custom command.
>>> FAILED: src/compiler/ir_expression_operation.h
>>> .../host/bin/meson --internal exe .../build/mesa3d-19.0.2/build/meson-private/meson_exe_python3_f99bf283dabcb83e5389be4bfb906240d67be6d7.dat
>>> Traceback (most recent call last):
>>>   File "../src/compiler/glsl/ir_expression_operation.py", line 23, in <module>
>>>     import mako.template
>>> ModuleNotFoundError: No module named 'mako'
>>> [36/843] Generating nir_constant_expre....c with a meson_exe.py custom command.
>>> FAILED: src/compiler/nir/nir_constant_expressions.c
>>> .../host/bin/meson --internal exe .../build/mesa3d-19.0.2/build/meson-private/meson_exe_python3_16aba73c258f517db1423ca1fcbcc47a6f58541b.dat
>>> Traceback (most recent call last):
>>>   File "../src/compiler/nir/nir_constant_expressions.py", line 424, in <module>
>>>     from mako.template import Template
>>> ModuleNotFoundError: No module named 'mako'
>>> [37/843] Generating nir_builder_opcodes.h with a meson_exe.py custom command.
>>> FAILED: src/compiler/nir/nir_builder_opcodes.h
>>> .../host/bin/meson --internal exe .../build/mesa3d-19.0.2/build/meson-private/meson_exe_python3_9519d8170e7bc8796b8caf294704c1ae9b9beb60.dat
>>> Traceback (most recent call last):
>>>   File "../src/compiler/nir/nir_builder_opcodes_h.py", line 98, in <module>
>>>     from mako.template import Template
>>> ModuleNotFoundError: No module named 'mako'
>>> [38/843] Generating nir_opcodes.h with a meson_exe.py custom command.
>>> FAILED: src/compiler/nir/nir_opcodes.h
>>> .../host/bin/meson --internal exe .../build/mesa3d-19.0.2/build/meson-private/meson_exe_python3_7d8bc70fe02c4d6671c051c06b6c456b05bca90c.dat
>>> Traceback (most recent call last):
>>>   File "../src/compiler/nir/nir_opcodes_h.py", line 45, in <module>
>>>     from mako.template import Template
>>> ModuleNotFoundError: No module named 'mako'
>>> [45/843] Generating format_srgb with a meson_exe.py custom command.
>>> ninja: build stopped: subcommand failed.
>>> make[1]: *** [package/pkg-generic.mk:241: .../build/mesa3d-19.0.2/.stamp_built] Error 1
>>>
>>>
>>> Seems the patch 0002-meson-use-generated-files-if-already-present-in-the-.patch is
>>> not enough to prevent all python-mako based file generation calls...  
>>
>> Indeed, this doesn't work when some drivers (like etnaviv) are enabled.
>>
>> I don't see other solution than adding a new package python3-mako like it was
>> done for python3-setuptools.
>> See: http://lists.busybox.net/pipermail/buildroot/2019-April/247707.html
>>
>> It's pity that the meson build system can't use existing generated files present
>> in the release archive.
> 
> Did a 'hack' patch to avoid file generation (not upstreamable, but for a first try):
> 

I tried but it doesn't work for all cases.
Instead, I added a host-python3-mako package.

See http://patchwork.ozlabs.org/project/buildroot/list/?series=106301

Best regards,
Romain

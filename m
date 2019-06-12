From: Victor Huesca <victor.huesca@bootlin.com>
Date: Wed, 12 Jun 2019 08:42:05 +0200
Subject: [Buildroot] [PATCH 0/4] Sanetize packages version
Message-ID: <20190612064209.23619-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch serie aims to sanitize the package versions in buildroot.
The aim behind this patch is to ease the track of out of date packages
by comparing the buildroot version with the version tracked on release-
monitoring.

Currently versions are tracked via the <pkg>_VERSION variable which cause
the following issues:
1. The <pkg>_VERSION variable is not uniform across packages.
2. The <pkg>_VERSION does not correspond to the pattern followed by release-
monitoring and thus does not allow us to compare our package version with
the latest one.


Unfortunately this patch serie does not fix every corner-case.

In particular packages fetched via git cannot be easily sanitized. The
implementation behind the git method is to use the <pkg>_VERSION after the
rope cloning to checkout the version tag. A workaround could be to add a
new variable to the infrastructure that can be set to specify the tag for
these cases.

Also, there are a few packages that use the <pkg>_VERSION variable to store
more than just the version. For example gap-madam-bin-maxi have a suffix
depending on whereas the frame buffer is selected. An other example is lua-
coatpersistent which seems to have two backends  and store this in the
version variable.

A last case I found is the case of Kodi. Kodi's major versions have a
codename in addition to the version number (eg. 18.2 "Leia" or 17.3 "Krypton").
This codename may or not be consider as an inherent part of the version. I
would tend to consider this as part of the version and keep it as a version
suffix for all kodi-related packages as it is currently.


Any comments/suggetion regarding the above points are welcome.


Victor Huesca (4):
  package: remove 'v' prefix from github-fetched packages
  package: remove 'v' prefix from tarball-fetched packages
  package: remove non-conventional prefix/suffix from github-fetched
    packages
  package: remove non-conventional prefix/suffix from tarball-fetched
    packages

 boot/afboot-stm32/afboot-stm32.hash                         | 2 +-
 boot/afboot-stm32/afboot-stm32.mk                           | 4 ++--
 boot/opensbi/opensbi.hash                                   | 2 +-
 boot/opensbi/opensbi.mk                                     | 4 ++--
 package/a10disp/a10disp.hash                                | 2 +-
 package/a10disp/a10disp.mk                                  | 4 ++--
 package/angular-websocket/angular-websocket.hash            | 2 +-
 package/angular-websocket/angular-websocket.mk              | 4 ++--
 package/assimp/assimp.hash                                  | 2 +-
 package/assimp/assimp.mk                                    | 4 ++--
 package/azmq/azmq.hash                                      | 2 +-
 package/azmq/azmq.mk                                        | 4 ++--
 package/bandwidthd/bandwidthd.hash                          | 2 +-
 package/bandwidthd/bandwidthd.mk                            | 4 ++--
 package/bats-core/bats-core.hash                            | 2 +-
 package/bats-core/bats-core.mk                              | 4 ++--
 package/bcache-tools/bcache-tools.hash                      | 2 +-
 package/bcache-tools/bcache-tools.mk                        | 4 ++--
 package/bluez-alsa/bluez-alsa.hash                          | 2 +-
 package/bluez-alsa/bluez-alsa.mk                            | 4 ++--
 package/c-periphery/c-periphery.hash                        | 2 +-
 package/c-periphery/c-periphery.mk                          | 4 ++--
 package/can-utils/can-utils.hash                            | 2 +-
 package/can-utils/can-utils.mk                              | 4 ++--
 package/capnproto/capnproto.hash                            | 2 +-
 package/capnproto/capnproto.mk                              | 4 ++--
 package/cbootimage/cbootimage.hash                          | 2 +-
 package/cbootimage/cbootimage.mk                            | 4 ++--
 package/civetweb/civetweb.hash                              | 2 +-
 package/civetweb/civetweb.mk                                | 4 ++--
 package/cjson/cjson.hash                                    | 2 +-
 package/cjson/cjson.mk                                      | 4 ++--
 package/cog/cog.hash                                        | 2 +-
 package/cog/cog.mk                                          | 4 ++--
 package/corkscrew/corkscrew.hash                            | 2 +-
 package/corkscrew/corkscrew.mk                              | 4 ++--
 package/cppzmq/cppzmq.hash                                  | 2 +-
 package/cppzmq/cppzmq.mk                                    | 4 ++--
 package/cpuload/cpuload.hash                                | 2 +-
 package/cpuload/cpuload.mk                                  | 4 ++--
 package/davici/davici.hash                                  | 2 +-
 package/davici/davici.mk                                    | 4 ++--
 package/docker-cli/docker-cli.hash                          | 2 +-
 package/docker-cli/docker-cli.mk                            | 4 ++--
 package/docker-containerd/docker-containerd.hash            | 2 +-
 package/docker-containerd/docker-containerd.mk              | 4 ++--
 package/docker-engine/docker-engine.hash                    | 2 +-
 package/docker-engine/docker-engine.mk                      | 4 ++--
 package/dt/dt.mk                                            | 4 ++--
 package/dtach/dtach.hash                                    | 2 +-
 package/dtach/dtach.mk                                      | 4 ++--
 package/duktape/duktape.hash                                | 2 +-
 package/duktape/duktape.mk                                  | 4 ++--
 package/emlog/emlog.hash                                    | 2 +-
 package/emlog/emlog.mk                                      | 4 ++--
 package/faifa/faifa.hash                                    | 2 +-
 package/faifa/faifa.mk                                      | 4 ++--
 package/faketime/faketime.hash                              | 2 +-
 package/faketime/faketime.mk                                | 4 ++--
 package/flannel/flannel.mk                                  | 6 +++---
 package/flare-engine/flare-engine.hash                      | 2 +-
 package/flare-engine/flare-engine.mk                        | 4 ++--
 package/flare-game/flare-game.hash                          | 2 +-
 package/flare-game/flare-game.mk                            | 4 ++--
 package/flatbuffers/flatbuffers.hash                        | 2 +-
 package/flatbuffers/flatbuffers.mk                          | 4 ++--
 package/flatcc/flatcc.hash                                  | 2 +-
 package/flatcc/flatcc.mk                                    | 4 ++--
 package/font-awesome/font-awesome.hash                      | 2 +-
 package/font-awesome/font-awesome.mk                        | 4 ++--
 package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash    | 2 +-
 package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk      | 4 ++--
 package/fwts/fwts.mk                                        | 3 ++-
 package/fwup/fwup.hash                                      | 2 +-
 package/fwup/fwup.mk                                        | 4 ++--
 package/gerbera/gerbera.hash                                | 2 +-
 package/gerbera/gerbera.mk                                  | 4 ++--
 package/gflags/gflags.hash                                  | 2 +-
 package/gflags/gflags.mk                                    | 4 ++--
 package/glog/glog.hash                                      | 2 +-
 package/glog/glog.mk                                        | 4 ++--
 package/gqrx/gqrx.hash                                      | 2 +-
 package/gqrx/gqrx.mk                                        | 4 ++--
 package/grpc/grpc.hash                                      | 2 +-
 package/grpc/grpc.mk                                        | 4 ++--
 package/gstreamer/gst-omapfb/gst-omapfb.hash                | 2 +-
 package/gstreamer/gst-omapfb/gst-omapfb.mk                  | 4 ++--
 .../gst1-plugins-bayer2rgb-neon.mk                          | 4 ++--
 package/gtest/gtest.hash                                    | 2 +-
 package/gtest/gtest.mk                                      | 4 ++--
 package/hiredis/hiredis.hash                                | 2 +-
 package/hiredis/hiredis.mk                                  | 4 ++--
 package/hwdata/hwdata.hash                                  | 2 +-
 package/hwdata/hwdata.mk                                    | 4 ++--
 package/igd2-for-linux/igd2-for-linux.hash                  | 2 +-
 package/igd2-for-linux/igd2-for-linux.mk                    | 4 ++--
 package/input-event-daemon/input-event-daemon.hash          | 2 +-
 package/input-event-daemon/input-event-daemon.mk            | 4 ++--
 package/intel-microcode/intel-microcode.hash                | 2 +-
 package/intel-microcode/intel-microcode.mk                  | 4 ++--
 package/iputils/iputils.hash                                | 2 +-
 package/iputils/iputils.mk                                  | 4 ++--
 package/irqbalance/irqbalance.hash                          | 2 +-
 package/irqbalance/irqbalance.mk                            | 4 ++--
 package/jack2/jack2.hash                                    | 2 +-
 package/jack2/jack2.mk                                      | 4 ++--
 package/janus-gateway/janus-gateway.hash                    | 2 +-
 package/janus-gateway/janus-gateway.mk                      | 4 ++--
 package/jasper/jasper.hash                                  | 2 +-
 package/jasper/jasper.mk                                    | 4 ++--
 package/jquery-keyboard/jquery-keyboard.hash                | 2 +-
 package/jquery-keyboard/jquery-keyboard.mk                  | 4 ++--
 package/json-for-modern-cpp/json-for-modern-cpp.mk          | 6 +++---
 .../kodi-audiodecoder-modplug.hash                          | 2 +-
 .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk  | 4 ++--
 .../kodi-audiodecoder-nosefart.hash                         | 2 +-
 .../kodi-audiodecoder-nosefart.mk                           | 4 ++--
 .../kodi-audiodecoder-sidplay.hash                          | 2 +-
 .../kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk  | 4 ++--
 .../kodi-audiodecoder-snesapu.hash                          | 2 +-
 .../kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk  | 4 ++--
 .../kodi-audiodecoder-stsound.hash                          | 2 +-
 .../kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk  | 4 ++--
 .../kodi-audiodecoder-timidity.hash                         | 2 +-
 .../kodi-audiodecoder-timidity.mk                           | 4 ++--
 .../kodi-audiodecoder-vgmstream.hash                        | 2 +-
 .../kodi-audiodecoder-vgmstream.mk                          | 4 ++--
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash  | 2 +-
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk    | 4 ++--
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash  | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk    | 4 ++--
 .../kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash  | 2 +-
 .../kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk    | 4 ++--
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash    | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk      | 4 ++--
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash    | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk      | 4 ++--
 .../kodi-peripheral-joystick/kodi-peripheral-joystick.hash  | 2 +-
 .../kodi-peripheral-joystick/kodi-peripheral-joystick.mk    | 4 ++--
 .../kodi-screensaver-asteroids.hash                         | 2 +-
 .../kodi-screensaver-asteroids.mk                           | 4 ++--
 .../kodi-screensaver-asterwave.hash                         | 2 +-
 .../kodi-screensaver-asterwave.mk                           | 4 ++--
 .../kodi-screensaver-biogenesis.hash                        | 2 +-
 .../kodi-screensaver-biogenesis.mk                          | 4 ++--
 .../kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash  | 2 +-
 .../kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk    | 4 ++--
 .../kodi-screensaver-greynetic.hash                         | 2 +-
 .../kodi-screensaver-greynetic.mk                           | 4 ++--
 .../kodi-screensaver-matrixtrails.hash                      | 2 +-
 .../kodi-screensaver-matrixtrails.mk                        | 4 ++--
 .../kodi-screensaver-pingpong.hash                          | 2 +-
 .../kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk  | 4 ++--
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash    | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk      | 4 ++--
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash    | 2 +-
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk      | 4 ++--
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash  | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk    | 4 ++--
 .../kodi-visualisation-fishbmc.hash                         | 2 +-
 .../kodi-visualisation-fishbmc.mk                           | 4 ++--
 .../kodi-visualisation-shadertoy.hash                       | 2 +-
 .../kodi-visualisation-shadertoy.mk                         | 4 ++--
 .../kodi-visualisation-spectrum.hash                        | 2 +-
 .../kodi-visualisation-spectrum.mk                          | 4 ++--
 .../kodi-visualisation-waveform.hash                        | 2 +-
 .../kodi-visualisation-waveform.mk                          | 4 ++--
 package/kompexsqlite/kompexsqlite.mk                        | 4 ++--
 package/kvazaar/kvazaar.hash                                | 2 +-
 package/kvazaar/kvazaar.mk                                  | 4 ++--
 package/lcdapi/lcdapi.hash                                  | 2 +-
 package/lcdapi/lcdapi.mk                                    | 4 ++--
 package/let-me-create/let-me-create.hash                    | 2 +-
 package/let-me-create/let-me-create.mk                      | 4 ++--
 package/leveldb/leveldb.hash                                | 2 +-
 package/leveldb/leveldb.mk                                  | 4 ++--
 package/libatomic_ops/libatomic_ops.hash                    | 2 +-
 package/libatomic_ops/libatomic_ops.mk                      | 4 ++--
 package/libcoap/libcoap.hash                                | 2 +-
 package/libcoap/libcoap.mk                                  | 4 ++--
 package/libconfig/libconfig.hash                            | 2 +-
 package/libconfig/libconfig.mk                              | 4 ++--
 package/libcpprestsdk/libcpprestsdk.hash                    | 2 +-
 package/libcpprestsdk/libcpprestsdk.mk                      | 4 ++--
 package/libcue/libcue.hash                                  | 2 +-
 package/libcue/libcue.mk                                    | 4 ++--
 package/libcuefile/libcuefile.mk                            | 4 ++--
 package/libdcadec/libdcadec.hash                            | 2 +-
 package/libdcadec/libdcadec.mk                              | 4 ++--
 package/libebur128/libebur128.hash                          | 2 +-
 package/libebur128/libebur128.mk                            | 4 ++--
 package/libevent/libevent.mk                                | 5 +++--
 package/libfastjson/libfastjson.hash                        | 2 +-
 package/libfastjson/libfastjson.mk                          | 4 ++--
 package/libffi/libffi.hash                                  | 2 +-
 package/libffi/libffi.mk                                    | 4 ++--
 package/libgit2/libgit2.hash                                | 2 +-
 package/libgit2/libgit2.mk                                  | 4 ++--
 package/libhttpparser/libhttpparser.hash                    | 2 +-
 package/libhttpparser/libhttpparser.mk                      | 4 ++--
 package/libiqrf/libiqrf.hash                                | 2 +-
 package/libiqrf/libiqrf.mk                                  | 4 ++--
 package/libite/libite.hash                                  | 2 +-
 package/libite/libite.mk                                    | 4 ++--
 package/liblog4c-localtime/liblog4c-localtime.hash          | 2 +-
 package/liblog4c-localtime/liblog4c-localtime.mk            | 4 ++--
 package/libndp/libndp.hash                                  | 2 +-
 package/libndp/libndp.mk                                    | 4 ++--
 package/libnfs/libnfs.hash                                  | 2 +-
 package/libnfs/libnfs.mk                                    | 4 ++--
 package/libopenh264/libopenh264.hash                        | 2 +-
 package/libopenh264/libopenh264.mk                          | 4 ++--
 package/libpagekite/libpagekite.hash                        | 4 ++--
 package/libpagekite/libpagekite.mk                          | 4 ++--
 package/libpam-tacplus/libpam-tacplus.hash                  | 2 +-
 package/libpam-tacplus/libpam-tacplus.mk                    | 4 ++--
 package/librsync/librsync.hash                              | 2 +-
 package/librsync/librsync.mk                                | 4 ++--
 package/librtas/librtas.hash                                | 2 +-
 package/librtas/librtas.mk                                  | 4 ++--
 package/libscrypt/libscrypt.hash                            | 2 +-
 package/libscrypt/libscrypt.mk                              | 4 ++--
 package/libseccomp/libseccomp.hash                          | 2 +-
 package/libseccomp/libseccomp.mk                            | 4 ++--
 package/libserial/libserial.hash                            | 2 +-
 package/libserial/libserial.mk                              | 4 ++--
 package/libsrtp/libsrtp.hash                                | 2 +-
 package/libsrtp/libsrtp.mk                                  | 4 ++--
 package/libtpl/libtpl.hash                                  | 2 +-
 package/libtpl/libtpl.mk                                    | 4 ++--
 package/libusbgx/libusbgx.hash                              | 2 +-
 package/libusbgx/libusbgx.mk                                | 4 ++--
 package/libuv/libuv.hash                                    | 2 +-
 package/libuv/libuv.mk                                      | 4 ++--
 package/libvpx/libvpx.hash                                  | 2 +-
 package/libvpx/libvpx.mk                                    | 4 ++--
 package/libwebsockets/libwebsockets.hash                    | 2 +-
 package/libwebsockets/libwebsockets.mk                      | 4 ++--
 package/liquid-dsp/liquid-dsp.hash                          | 2 +-
 package/liquid-dsp/liquid-dsp.mk                            | 4 ++--
 package/ljsyscall/ljsyscall.hash                            | 2 +-
 package/ljsyscall/ljsyscall.mk                              | 4 ++--
 package/lm-sensors/lm-sensors.hash                          | 2 +-
 package/lm-sensors/lm-sensors.mk                            | 4 ++--
 package/lshw/lshw.mk                                        | 3 ++-
 package/lua-cqueues/lua-cqueues.hash                        | 2 +-
 package/lua-cqueues/lua-cqueues.mk                          | 4 ++--
 package/lua-sdl2/lua-sdl2.hash                              | 2 +-
 package/lua-sdl2/lua-sdl2.mk                                | 4 ++--
 package/luvi/luvi.mk                                        | 4 ++--
 package/lz4/lz4.hash                                        | 2 +-
 package/lz4/lz4.mk                                          | 4 ++--
 package/mfgtools/mfgtools.hash                              | 2 +-
 package/mfgtools/mfgtools.mk                                | 4 ++--
 package/micropython-lib/micropython-lib.hash                | 2 +-
 package/micropython-lib/micropython-lib.mk                  | 4 ++--
 package/micropython/micropython.hash                        | 2 +-
 package/micropython/micropython.mk                          | 4 ++--
 package/mini-snmpd/mini-snmpd.hash                          | 2 +-
 package/mini-snmpd/mini-snmpd.mk                            | 4 ++--
 package/mksh/mksh.mk                                        | 4 ++--
 package/motion/motion.hash                                  | 2 +-
 package/motion/motion.mk                                    | 4 ++--
 package/mraa/mraa.hash                                      | 2 +-
 package/mraa/mraa.mk                                        | 4 ++--
 package/ne10/ne10.hash                                      | 2 +-
 package/ne10/ne10.mk                                        | 4 ++--
 package/nginx-dav-ext/nginx-dav-ext.hash                    | 2 +-
 package/nginx-dav-ext/nginx-dav-ext.mk                      | 4 ++--
 package/nilfs-utils/nilfs-utils.hash                        | 2 +-
 package/nilfs-utils/nilfs-utils.mk                          | 4 ++--
 package/ninja/ninja.hash                                    | 2 +-
 package/ninja/ninja.mk                                      | 4 ++--
 package/numactl/numactl.hash                                | 2 +-
 package/numactl/numactl.mk                                  | 4 ++--
 package/nvme/nvme.hash                                      | 2 +-
 package/nvme/nvme.mk                                        | 4 ++--
 package/openblas/openblas.hash                              | 2 +-
 package/openblas/openblas.mk                                | 4 ++--
 package/openjdk/openjdk.hash                                | 2 +-
 package/openjdk/openjdk.mk                                  | 4 ++--
 package/openpowerlink/openpowerlink.mk                      | 4 ++--
 package/opentracing-cpp/opentracing-cpp.hash                | 2 +-
 package/opentracing-cpp/opentracing-cpp.mk                  | 4 ++--
 package/openzwave/openzwave.hash                            | 2 +-
 package/openzwave/openzwave.mk                              | 4 ++--
 package/paho-mqtt-c/paho-mqtt-c.hash                        | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk                          | 4 ++--
 package/paho-mqtt-cpp/paho-mqtt-cpp.hash                    | 2 +-
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk                      | 4 ++--
 package/pdbg/pdbg.hash                                      | 2 +-
 package/pdbg/pdbg.mk                                        | 4 ++--
 package/perl-class-std-fast/perl-class-std-fast.mk          | 4 ++--
 package/perl-net-snmp/perl-net-snmp.mk                      | 4 ++--
 package/pigpio/pigpio.hash                                  | 2 +-
 package/pigpio/pigpio.mk                                    | 4 ++--
 package/pigz/pigz.hash                                      | 2 +-
 package/pigz/pigz.mk                                        | 4 ++--
 package/poco/poco.hash                                      | 2 +-
 package/poco/poco.mk                                        | 4 ++--
 package/portaudio/portaudio.mk                              | 4 ++--
 package/powerpc-utils/powerpc-utils.hash                    | 2 +-
 package/powerpc-utils/powerpc-utils.mk                      | 4 ++--
 package/protobuf-c/protobuf-c.hash                          | 2 +-
 package/protobuf-c/protobuf-c.mk                            | 4 ++--
 package/pru-software-support/pru-software-support.hash      | 2 +-
 package/pru-software-support/pru-software-support.mk        | 4 ++--
 package/ptpd2/ptpd2.hash                                    | 2 +-
 package/ptpd2/ptpd2.mk                                      | 4 ++--
 package/python-configshell-fb/python-configshell-fb.hash    | 2 +-
 package/python-configshell-fb/python-configshell-fb.mk      | 4 ++--
 package/python-pydal/python-pydal.hash                      | 2 +-
 package/python-pydal/python-pydal.mk                        | 4 ++--
 package/python-pymodbus/python-pymodbus.hash                | 2 +-
 package/python-pymodbus/python-pymodbus.mk                  | 4 ++--
 package/python-pyparted/python-pyparted.hash                | 2 +-
 package/python-pyparted/python-pyparted.mk                  | 4 ++--
 package/python-remi/python-remi.hash                        | 2 +-
 package/python-remi/python-remi.mk                          | 4 ++--
 package/python-rtslib-fb/python-rtslib-fb.hash              | 2 +-
 package/python-rtslib-fb/python-rtslib-fb.mk                | 4 ++--
 package/python-scapy3k/python-scapy3k.hash                  | 2 +-
 package/python-scapy3k/python-scapy3k.mk                    | 4 ++--
 package/python-web2py/python-web2py.hash                    | 2 +-
 package/python-web2py/python-web2py.mk                      | 4 ++--
 package/python-webpy/python-webpy.hash                      | 2 +-
 package/python-webpy/python-webpy.mk                        | 4 ++--
 package/qdecoder/qdecoder.hash                              | 2 +-
 package/qdecoder/qdecoder.mk                                | 4 ++--
 package/qlibc/qlibc.hash                                    | 2 +-
 package/qlibc/qlibc.mk                                      | 4 ++--
 package/rabbitmq-c/rabbitmq-c.hash                          | 2 +-
 package/rabbitmq-c/rabbitmq-c.mk                            | 4 ++--
 package/rapidjson/rapidjson.hash                            | 2 +-
 package/rapidjson/rapidjson.mk                              | 4 ++--
 package/reaver/reaver.hash                                  | 2 +-
 package/reaver/reaver.mk                                    | 4 ++--
 package/runc/runc.hash                                      | 2 +-
 package/runc/runc.mk                                        | 4 ++--
 package/safeclib/safeclib.hash                              | 2 +-
 package/safeclib/safeclib.mk                                | 4 ++--
 package/shellinabox/shellinabox.hash                        | 2 +-
 package/shellinabox/shellinabox.mk                          | 4 ++--
 package/sngrep/sngrep.hash                                  | 2 +-
 package/sngrep/sngrep.mk                                    | 4 ++--
 package/softether/softether.hash                            | 2 +-
 package/softether/softether.mk                              | 4 ++--
 package/spidev_test/spidev_test.mk                          | 6 +++---
 package/sqlcipher/sqlcipher.hash                            | 2 +-
 package/sqlcipher/sqlcipher.mk                              | 4 ++--
 package/sslh/sslh.mk                                        | 3 ++-
 package/sunxi-tools/sunxi-tools.hash                        | 2 +-
 package/sunxi-tools/sunxi-tools.mk                          | 4 ++--
 package/synergy/synergy.hash                                | 2 +-
 package/synergy/synergy.mk                                  | 4 ++--
 package/targetcli-fb/targetcli-fb.hash                      | 2 +-
 package/targetcli-fb/targetcli-fb.mk                        | 4 ++--
 package/tegrarcm/tegrarcm.hash                              | 2 +-
 package/tegrarcm/tegrarcm.mk                                | 4 ++--
 package/tini/tini.hash                                      | 2 +-
 package/tini/tini.mk                                        | 4 ++--
 package/tinycbor/tinycbor.hash                              | 2 +-
 package/tinycbor/tinycbor.mk                                | 4 ++--
 package/tinymembench/tinymembench.hash                      | 2 +-
 package/tinymembench/tinymembench.mk                        | 4 ++--
 package/turbolua/turbolua.hash                              | 2 +-
 package/turbolua/turbolua.mk                                | 4 ++--
 package/uccp420wlan/uccp420wlan.hash                        | 2 +-
 package/uccp420wlan/uccp420wlan.mk                          | 4 ++--
 package/uhubctl/uhubctl.hash                                | 2 +-
 package/uhubctl/uhubctl.mk                                  | 4 ++--
 package/v4l2loopback/v4l2loopback.hash                      | 2 +-
 package/v4l2loopback/v4l2loopback.mk                        | 4 ++--
 package/valijson/valijson.hash                              | 2 +-
 package/valijson/valijson.mk                                | 4 ++--
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash    | 2 +-
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk      | 4 ++--
 package/vim/vim.hash                                        | 2 +-
 package/vim/vim.mk                                          | 4 ++--
 package/vmtouch/vmtouch.hash                                | 2 +-
 package/vmtouch/vmtouch.mk                                  | 4 ++--
 package/waffle/waffle.hash                                  | 2 +-
 package/waffle/waffle.mk                                    | 4 ++--
 package/wampcc/wampcc.hash                                  | 2 +-
 package/wampcc/wampcc.mk                                    | 4 ++--
 package/wavemon/wavemon.hash                                | 2 +-
 package/wavemon/wavemon.mk                                  | 4 ++--
 package/xdotool/xdotool.hash                                | 2 +-
 package/xdotool/xdotool.mk                                  | 4 ++--
 package/xinetd/xinetd.hash                                  | 2 +-
 package/xinetd/xinetd.mk                                    | 4 ++--
 package/xl2tp/xl2tp.hash                                    | 2 +-
 package/xl2tp/xl2tp.mk                                      | 4 ++--
 package/xxhash/xxhash.hash                                  | 2 +-
 package/xxhash/xxhash.mk                                    | 4 ++--
 package/ympd/ympd.hash                                      | 2 +-
 package/ympd/ympd.mk                                        | 4 ++--
 package/zstd/zstd.hash                                      | 2 +-
 package/zstd/zstd.mk                                        | 4 ++--
 package/zynq-boot-bin/zynq-boot-bin.mk                      | 4 ++--
 package/zyre/zyre.hash                                      | 2 +-
 package/zyre/zyre.mk                                        | 4 ++--
 402 files changed, 617 insertions(+), 613 deletions(-)

-- 
2.21.0

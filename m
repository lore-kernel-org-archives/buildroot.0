From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2020 12:44:32 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] package/live555: fix static build with openssl
In-Reply-To: <20200713155135.1214109-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 13 Jul 2020 17:51:34 +0200")
References: <20200713155135.1214109-1-fontaine.fabrice@gmail.com>
Message-ID: <875z7qs227.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use pkg-config to retrieve openssl static dependencies such as -lz or
 > -latomic.

 > Moreover, don't pass the openssl libraries to LIBS_FOR_LIVEMEDIA_LIB
 > when linking statically with ar or the build will break on:

 > /home/fabrice/buildroot/output/per-package/live555/host/bin/arm-linux-ar cr libliveMedia.a  \
 > 	Media.o MediaSource.o FramedSource.o FramedFileSource.o FramedFilter.o ByteStreamFileSource.o ByteStreamMultiFileSource.o ByteStreamMemoryBufferSource.o BasicUDPSource.o DeviceSource.o AudioInputDevice.o WAVAudioFileSource.o MPEG1or2Demux.o MPEG1or2DemuxedElementaryStream.o MPEGVideoStreamFramer.o MPEG1or2VideoStreamFramer.o MPEG1or2VideoStreamDiscreteFramer.o MPEG4VideoStreamFramer.o MPEG4VideoStreamDiscreteFramer.o H264or5VideoStreamFramer.o H264or5VideoStreamDiscreteFramer.o H264VideoStreamFramer.o H264VideoStreamDiscreteFramer.o H265VideoStreamFramer.o H265VideoStreamDiscreteFramer.o MPEGVideoStreamParser.o MPEG1or2AudioStreamFramer.o MPEG1or2AudioRTPSource.o MPEG4LATMAudioRTPSource.o MPEG4ESVideoRTPSource.o MPEG4GenericRTPSource.o MP3FileSource.o MP3Transcoder.o MP3ADU.o MP3ADUdescriptor.o MP3ADUinterleaving.o MP3ADUTranscoder.o MP3StreamState.o MP3Internals.o MP3InternalsHuffman.o MP3InternalsHuffmanTable.o MP3ADURTPSource.o MPEG1or2VideoRTPSource.o MPEG2TransportSt
 rea
 >  mMultiplexor.o MPEG2TransportStreamFromPESSource.o MPEG2TransportStreamFromESSource.o MPEG2TransportStreamFramer.o MPEG2TransportStreamAccumulator.o ADTSAudioFileSource.o ADTSAudioStreamDiscreteFramer.o JPEGVideoSource.o JPEGVideoRTPSource.o JPEG2000VideoRTPSource.o H263plusVideoRTPSource.o H263plusVideoStreamFramer.o H263plusVideoStreamParser.o AC3AudioStreamFramer.o AC3AudioRTPSource.o DVVideoStreamFramer.o DVVideoRTPSource.o AMRAudioSource.o AMRAudioFileSource.o InputFile.o StreamReplicator.o MediaSink.o FileSink.o BasicUDPSink.o AMRAudioFileSink.o H264or5VideoFileSink.o H264VideoFileSink.o H265VideoFileSink.o OggFileSink.o MPEG1or2AudioRTPSink.o MP3ADURTPSink.o MPEG1or2VideoRTPSink.o MPEG4LATMAudioRTPSink.o MPEG4GenericRTPSink.o MPEG4ESVideoRTPSink.o JPEGVideoRTPSink.o JPEG2000VideoRTPSink.o H263plusVideoRTPSink.o H264or5VideoRTPSink.o H264VideoRTPSink.o H265VideoRTPSink.o DVVideoRTPSink.o AC3AudioRTPSink.o VorbisAudioRTPSink.o TheoraVideoRTPSink.o VP8VideoRTPSink.o V
 P9V
 >  ideoRTPSink.o GSMAudioRTPSink.o SimpleRTPSink.o AMRAudioRTPSink.o T140TextRTPSink.o OutputFile.o RawVideoRTPSink.o uLawAudioFilter.o RTPSource.o MultiFramedRTPSource.o SimpleRTPSource.o H261VideoRTPSource.o H264VideoRTPSource.o H265VideoRTPSource.o QCELPAudioRTPSource.o AMRAudioRTPSource.o VorbisAudioRTPSource.o TheoraVideoRTPSource.o VP8VideoRTPSource.o VP9VideoRTPSource.o RawVideoRTPSource.o RTPSink.o MultiFramedRTPSink.o AudioRTPSink.o VideoRTPSink.o TextRTPSink.o RTPInterface.o RTCP.o rtcp_from_spec.o GenericMediaServer.o RTSPServer.o RTSPServerRegister.o RTSPClient.o RTSPCommon.o RTSPRegisterSender.o SIPClient.o MediaSession.o ServerMediaSession.o PassiveServerMediaSubsession.o OnDemandServerMediaSubsession.o FileServerMediaSubsession.o MPEG4VideoFileServerMediaSubsession.o H264VideoFileServerMediaSubsession.o H265VideoFileServerMediaSubsession.o H263plusVideoFileServerMediaSubsession.o WAVAudioFileServerMediaSubsession.o AMRAudioFileServerMediaSubsession.o MP3AudioF
 ile
 >  ServerMediaSubsession.o MPEG1or2VideoFileServerMediaSubsession.o MPEG1or2FileServerDemux.o MPEG1or2DemuxedServerMediaSubsession.o MPEG2TransportFileServerMediaSubsession.o ADTSAudioFileServerMediaSubsession.o DVVideoFileServerMediaSubsession.o AC3AudioFileServerMediaSubsession.o MPEG2TransportUDPServerMediaSubsession.o ProxyServerMediaSession.o QuickTimeFileSink.o QuickTimeGenericRTPSource.o AVIFileSink.o MPEG2IndexFromTransportStream.o MPEG2TransportStreamIndexFile.o MPEG2TransportStreamTrickModeFilter.o MatroskaFile.o MatroskaFileParser.o EBMLNumber.o MatroskaDemuxedTrack.o MatroskaFileServerDemux.o MatroskaFileServerMediaSubsession.o MP3AudioMatroskaFileServerMediaSubsession.o OggFile.o OggFileParser.o OggDemuxedTrack.o OggFileServerDemux.o OggFileServerMediaSubsession.o MPEG2TransportStreamDemux.o MPEG2TransportStreamDemuxedTrack.o MPEG2TransportStreamParser.o MPEG2TransportStreamParser_PAT.o MPEG2TransportStreamParser_PMT.o MPEG2TransportStreamParser_STREAM.o HLSSegm
 ent
 >  er.o TLSState.o MIKEY.o SRTPCryptographicContext.o HMAC_SHA1.o BitVector.o StreamParser.o DigestAuthentication.o ourMD5.o Base64.o Locale.o -L/home/fabrice/buildroot/output/per-package/live555/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lssl -L/home/fabrice/buildroot/output/per-package/live555/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lz -latomic -lpthread -lcrypto -lz -latomic -lpthread
 > /home/fabrice/buildroot/output/per-package/live555/host/bin/arm-linux-ar: invalid option -- 'L'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1299a05cfaabccc45e2878e969b443a973ec4c9e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Enhance patch to avoid a build failure when building dynamically

 >  package/live555/live555.mk | 11 +++++++----
 >  1 file changed, 7 insertions(+), 4 deletions(-)

 > diff --git a/package/live555/live555.mk b/package/live555/live555.mk
 > index b2313886b1..0453b19751 100644
 > --- a/package/live555/live555.mk
 > +++ b/package/live555/live555.mk
 > @@ -23,8 +23,11 @@ LIVE555_CFLAGS += -fPIC
 >  endif
 
 >  ifeq ($(BR2_PACKAGE_OPENSSL),y)
 > -LIVE555_DEPENDENCIES += openssl
 > -LIVE555_LIBS = -lssl -lcrypto
 > +LIVE555_DEPENDENCIES += host-pkgconf openssl
 > +LIVE555_CONSOLE_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 > +ifneq ($(BR2_STATIC_LIBS),y)
 > +LIVE555_LIVEMEDIA_LIBS = $(LIVE555_CONSOLE_LIBS)
 > +endif

Committed after adding a comment explaining why we are only doing this
for !static, thanks.

-- 
Bye, Peter Korsgaard

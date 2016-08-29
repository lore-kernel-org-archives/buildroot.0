From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Aug 2016 13:40:30 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: fix ambiguous call to abs
Message-ID: <1472470830-24520-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/0ed9fa9585ec91db3556d6f5b4ca8d99a5eb2144

Add a patch to prefix all calls to abs by "std::" to be able to call abs
with a float otherwise call to abs(float) is ambiguous as the C abs
function that is commonly available for legacy reasons only handle int.

It should be noted that the source files in the domoticz tarballs have
DOS line endings, which don't appear when fetching the source code from
Git. Therefore, a patch generated from the Git repository doesn't apply
directly on the source code extracted from the tarball.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 .../domoticz/0002-Fix-ambiguous-call-to-abs.patch  | 328 +++++++++++++++++++++
 1 file changed, 328 insertions(+)
 create mode 100644 package/domoticz/0002-Fix-ambiguous-call-to-abs.patch

diff --git a/package/domoticz/0002-Fix-ambiguous-call-to-abs.patch b/package/domoticz/0002-Fix-ambiguous-call-to-abs.patch
new file mode 100644
index 0000000..7f7d3cb
--- /dev/null
+++ b/package/domoticz/0002-Fix-ambiguous-call-to-abs.patch
@@ -0,0 +1,328 @@
+From 331cd7d6eef6f9f2658b91e662644d88c31eaf64 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Mon, 29 Aug 2016 10:58:07 +0200
+Subject: [PATCH] Fix ambiguous call to abs
+
+Prefix all calls to abs by "std::" to be able to call abs with a float
+otherwise call to abs(float) is ambiguous as the C abs function that is
+commonly available for legacy reasons only handle int.
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ hardware/1Wire.cpp             |  2 +-
+ hardware/DavisLoggerSerial.cpp |  2 +-
+ hardware/DomoticzHardware.cpp  | 20 ++++++++++----------
+ hardware/EnOceanESP2.cpp       |  6 +++---
+ hardware/EnOceanESP3.cpp       |  6 +++---
+ hardware/ForecastIO.cpp        |  6 +++---
+ hardware/OpenZWave.cpp         |  4 ++--
+ hardware/P1MeterBase.cpp       |  2 +-
+ hardware/TE923.cpp             |  2 +-
+ hardware/Wunderground.cpp      |  6 +++---
+ hardware/ZWaveBase.cpp         |  2 +-
+ main/mainworker.cpp            |  4 ++--
+ 12 files changed, 31 insertions(+), 31 deletions(-)
+
+Index: b/hardware/1Wire.cpp
+--- a/hardware/1Wire.cpp
++++ b/hardware/1Wire.cpp
+@@ -455,7 +455,7 @@
+ 	tsen.TEMP.id2=(BYTE)deviceIdByteArray[1];
+ 
+ 	tsen.TEMP.tempsign=(temperature>=0)?0:1;
+-	int at10=round(abs(temperature*10.0f));
++	int at10=round(std::abs(temperature*10.0f));
+ 	tsen.TEMP.temperatureh=(BYTE)(at10/256);
+ 	at10-=(tsen.TEMP.temperatureh*256);
+ 	tsen.TEMP.temperaturel=(BYTE)(at10);
+Index: b/hardware/DavisLoggerSerial.cpp
+--- a/hardware/DavisLoggerSerial.cpp
++++ b/hardware/DavisLoggerSerial.cpp
+@@ -467,7 +467,7 @@
+ 		{
+ 			tsen.WIND.tempsign=(OutsideTemperature>=0)?0:1;
+ 			tsen.WIND.chillsign=(OutsideTemperature>=0)?0:1;
+-			int at10=round(abs(OutsideTemperature*10.0f));
++			int at10=round(std::abs(OutsideTemperature*10.0f));
+ 			tsen.WIND.temperatureh=(BYTE)(at10/256);
+ 			tsen.WIND.chillh=(BYTE)(at10/256);
+ 			at10-=(tsen.WIND.chillh*256);
+Index: b/hardware/DomoticzHardware.cpp
+--- a/hardware/DomoticzHardware.cpp
++++ b/hardware/DomoticzHardware.cpp
+@@ -151,7 +151,7 @@
+ 	tsen.TEMP.id1 = (NodeID & 0xFF00) >> 8;
+ 	tsen.TEMP.id2 = NodeID & 0xFF;
+ 	tsen.TEMP.tempsign = (temperature >= 0) ? 0 : 1;
+-	int at10 = round(abs(temperature*10.0f));
++	int at10 = round(std::abs(temperature*10.0f));
+ 	tsen.TEMP.temperatureh = (BYTE)(at10 / 256);
+ 	at10 -= (tsen.TEMP.temperatureh * 256);
+ 	tsen.TEMP.temperaturel = (BYTE)(at10);
+@@ -197,7 +197,7 @@
+ 	tsen.TEMP_HUM.id2 = NodeID & 0xFF;
+ 
+ 	tsen.TEMP_HUM.tempsign = (temperature >= 0) ? 0 : 1;
+-	int at10 = round(abs(temperature*10.0f));
++	int at10 = round(std::abs(temperature*10.0f));
+ 	tsen.TEMP_HUM.temperatureh = (BYTE)(at10 / 256);
+ 	at10 -= (tsen.TEMP_HUM.temperatureh * 256);
+ 	tsen.TEMP_HUM.temperaturel = (BYTE)(at10);
+@@ -220,7 +220,7 @@
+ 	tsen.TEMP_HUM_BARO.id2 = NodeID & 0xFF;
+ 
+ 	tsen.TEMP_HUM_BARO.tempsign = (temperature >= 0) ? 0 : 1;
+-	int at10 = round(abs(temperature*10.0f));
++	int at10 = round(std::abs(temperature*10.0f));
+ 	tsen.TEMP_HUM_BARO.temperatureh = (BYTE)(at10 / 256);
+ 	at10 -= (tsen.TEMP_HUM_BARO.temperatureh * 256);
+ 	tsen.TEMP_HUM_BARO.temperaturel = (BYTE)(at10);
+@@ -250,7 +250,7 @@
+ 	tsen.TEMP_HUM_BARO.id2 = NodeID & 0xFF;
+ 
+ 	tsen.TEMP_HUM_BARO.tempsign = (temperature >= 0) ? 0 : 1;
+-	int at10 = round(abs(temperature*10.0f));
++	int at10 = round(std::abs(temperature*10.0f));
+ 	tsen.TEMP_HUM_BARO.temperatureh = (BYTE)(at10 / 256);
+ 	at10 -= (tsen.TEMP_HUM_BARO.temperatureh * 256);
+ 	tsen.TEMP_HUM_BARO.temperaturel = (BYTE)(at10);
+@@ -633,17 +633,17 @@
+ 	tsen.CURRENT.id2 = NodeID & 0xFF;
+ 	tsen.CURRENT.battery_level = BatteryLevel;
+ 
+-	int at10 = round(abs(Current1*10.0f));
++	int at10 = round(std::abs(Current1*10.0f));
+ 	tsen.CURRENT.ch1h = (BYTE)(at10 / 256);
+ 	at10 -= (tsen.TEMP.temperatureh * 256);
+ 	tsen.CURRENT.ch1l = (BYTE)(at10);
+ 
+-	at10 = round(abs(Current2*10.0f));
++	at10 = round(std::abs(Current2*10.0f));
+ 	tsen.CURRENT.ch2h = (BYTE)(at10 / 256);
+ 	at10 -= (tsen.TEMP.temperatureh * 256);
+ 	tsen.CURRENT.ch2l = (BYTE)(at10);
+ 
+-	at10 = round(abs(Current3*10.0f));
++	at10 = round(std::abs(Current3*10.0f));
+ 	tsen.CURRENT.ch3h = (BYTE)(at10 / 256);
+ 	at10 -= (tsen.TEMP.temperatureh * 256);
+ 	tsen.CURRENT.ch3l = (BYTE)(at10);
+@@ -744,7 +744,7 @@
+ 		//No temp, only chill
+ 		tsen.WIND.tempsign = (WindChill >= 0) ? 0 : 1;
+ 		tsen.WIND.chillsign = (WindChill >= 0) ? 0 : 1;
+-		int at10 = round(abs(WindChill*10.0f));
++		int at10 = round(std::abs(WindChill*10.0f));
+ 		tsen.WIND.temperatureh = (BYTE)(at10 / 256);
+ 		tsen.WIND.chillh = (BYTE)(at10 / 256);
+ 		at10 -= (tsen.WIND.chillh * 256);
+@@ -755,13 +755,13 @@
+ 	{
+ 		//temp+chill
+ 		tsen.WIND.tempsign = (WindTemp >= 0) ? 0 : 1;
+-		int at10 = round(abs(WindTemp*10.0f));
++		int at10 = round(std::abs(WindTemp*10.0f));
+ 		tsen.WIND.temperatureh = (BYTE)(at10 / 256);
+ 		at10 -= (tsen.WIND.temperatureh * 256);
+ 		tsen.WIND.temperaturel = (BYTE)(at10);
+ 
+ 		tsen.WIND.chillsign = (WindChill >= 0) ? 0 : 1;
+-		at10 = round(abs(WindChill*10.0f));
++		at10 = round(std::abs(WindChill*10.0f));
+ 		tsen.WIND.chillh = (BYTE)(at10 / 256);
+ 		at10 -= (tsen.WIND.chillh * 256);
+ 		tsen.WIND.chilll = (BYTE)(at10);
+Index: b/hardware/EnOceanESP2.cpp
+--- a/hardware/EnOceanESP2.cpp
++++ b/hardware/EnOceanESP2.cpp
+@@ -1527,7 +1527,7 @@
+ 						tsen.TEMP.rssi=(pFrame->ID_BYTE0&0xF0)>>4;
+ 
+ 						tsen.TEMP.tempsign=(temp>=0)?0:1;
+-						int at10=round(abs(temp*10.0f));
++						int at10=round(std::abs(temp*10.0f));
+ 						tsen.TEMP.temperatureh=(BYTE)(at10/256);
+ 						at10-=(tsen.TEMP.temperatureh*256);
+ 						tsen.TEMP.temperaturel=(BYTE)(at10);
+@@ -1627,7 +1627,7 @@
+ 					tsen.TEMP.rssi=(pFrame->ID_BYTE0&0xF0)>>4;
+ 
+ 					tsen.TEMP.tempsign=(temp>=0)?0:1;
+-					int at10=round(abs(temp*10.0f));
++					int at10=round(std::abs(temp*10.0f));
+ 					tsen.TEMP.temperatureh=(BYTE)(at10/256);
+ 					at10-=(tsen.TEMP.temperatureh*256);
+ 					tsen.TEMP.temperaturel=(BYTE)(at10);
+@@ -1654,7 +1654,7 @@
+ 					tsen.TEMP_HUM.id2=pFrame->ID_BYTE1;
+ 					tsen.TEMP_HUM.battery_level=9;
+ 					tsen.TEMP_HUM.tempsign=(temp>=0)?0:1;
+-					int at10=round(abs(temp*10.0f));
++					int at10=round(std::abs(temp*10.0f));
+ 					tsen.TEMP_HUM.temperatureh=(BYTE)(at10/256);
+ 					at10-=(tsen.TEMP_HUM.temperatureh*256);
+ 					tsen.TEMP_HUM.temperaturel=(BYTE)(at10);
+Index: b/hardware/EnOceanESP3.cpp
+--- a/hardware/EnOceanESP3.cpp
++++ b/hardware/EnOceanESP3.cpp
+@@ -1253,7 +1253,7 @@
+ 							tsen.TEMP.rssi=(ID_BYTE0&0xF0)>>4;
+ 
+ 							tsen.TEMP.tempsign=(temp>=0)?0:1;
+-							int at10=round(abs(temp*10.0f));
++							int at10=round(std::abs(temp*10.0f));
+ 							tsen.TEMP.temperatureh=(BYTE)(at10/256);
+ 							at10-=(tsen.TEMP.temperatureh*256);
+ 							tsen.TEMP.temperaturel=(BYTE)(at10);
+@@ -1353,7 +1353,7 @@
+ 						tsen.TEMP.rssi=(ID_BYTE0&0xF0)>>4;
+ 
+ 						tsen.TEMP.tempsign=(temp>=0)?0:1;
+-						int at10=round(abs(temp*10.0f));
++						int at10=round(std::abs(temp*10.0f));
+ 						tsen.TEMP.temperatureh=(BYTE)(at10/256);
+ 						at10-=(tsen.TEMP.temperatureh*256);
+ 						tsen.TEMP.temperaturel=(BYTE)(at10);
+@@ -1380,7 +1380,7 @@
+ 						tsen.TEMP_HUM.id2=ID_BYTE1;
+ 						tsen.TEMP_HUM.battery_level=9;
+ 						tsen.TEMP_HUM.tempsign=(temp>=0)?0:1;
+-						int at10=round(abs(temp*10.0f));
++						int at10=round(std::abs(temp*10.0f));
+ 						tsen.TEMP_HUM.temperatureh=(BYTE)(at10/256);
+ 						at10-=(tsen.TEMP_HUM.temperatureh*256);
+ 						tsen.TEMP_HUM.temperaturel=(BYTE)(at10);
+Index: b/hardware/ForecastIO.cpp
+--- a/hardware/ForecastIO.cpp
++++ b/hardware/ForecastIO.cpp
+@@ -302,13 +302,13 @@
+ 		tsen.WIND.temperaturel=0;
+ 
+ 		tsen.WIND.tempsign=(wind_temp>=0)?0:1;
+-		int at10=round(abs(wind_temp*10.0f));
++		int at10=round(std::abs(wind_temp*10.0f));
+ 		tsen.WIND.temperatureh=(BYTE)(at10/256);
+ 		at10-=(tsen.WIND.temperatureh*256);
+ 		tsen.WIND.temperaturel=(BYTE)(at10);
+ 
+ 		tsen.WIND.chillsign=(wind_temp>=0)?0:1;
+-		at10=round(abs(wind_chill*10.0f));
++		at10=round(std::abs(wind_chill*10.0f));
+ 		tsen.WIND.chillh=(BYTE)(at10/256);
+ 		at10-=(tsen.WIND.chillh*256);
+ 		tsen.WIND.chilll=(BYTE)(at10);
+@@ -357,7 +357,7 @@
+ 						float rainrateph = static_cast<float>(atof(root["currently"]["precip_1hr_metric"].asString().c_str()));
+ 						if (rainrateph!=-9999.00f)
+ 						{
+-							int at10=round(abs(rainrateph*10.0f));
++							int at10=round(std::abs(rainrateph*10.0f));
+ 							tsen.RAIN.rainrateh=(BYTE)(at10/256);
+ 							at10-=(tsen.RAIN.rainrateh*256);
+ 							tsen.RAIN.rainratel=(BYTE)(at10);
+Index: b/hardware/OpenZWave.cpp
+--- a/hardware/OpenZWave.cpp
++++ b/hardware/OpenZWave.cpp
+@@ -2925,7 +2925,7 @@
+			//Convert to celcius
+			fValue = float((fValue - 32)*(5.0 / 9.0));
+		}
+-		pDevice->bValidValue = (abs(pDevice->floatValue - fValue) < 10);
++		pDevice->bValidValue = (std::abs(pDevice->floatValue - fValue) < 10);
+ 		pDevice->floatValue = fValue;
+ 		break;
+ 	case ZDTYPE_SENSOR_HUMIDITY:
+@@ -2997,7 +2997,7 @@
+ 			//Convert to celcius
+ 			fValue = float((fValue - 32)*(5.0 / 9.0));
+ 		}
+-		pDevice->bValidValue = (abs(pDevice->floatValue - fValue) < 10);
++		pDevice->bValidValue = (std::abs(pDevice->floatValue - fValue) < 10);
+ 		pDevice->floatValue = fValue;
+ 		break;
+ 	case ZDTYPE_SENSOR_PERCENTAGE:
+Index: b/hardware/P1MeterBase.cpp
+--- a/hardware/P1MeterBase.cpp
++++ b/hardware/P1MeterBase.cpp
+@@ -165,7 +165,7 @@
+ 			time_t atime=mytime(NULL);
+ 			sDecodeRXMessage(this, (const unsigned char *)&m_p1power, "Power", 255);
+ 			bool bSend2Shared=(atime-m_lastSharedSendElectra>59);
+-			if (abs(double(m_lastelectrausage)-double(m_p1power.usagecurrent))>40)
++			if (std::abs(double(m_lastelectrausage)-double(m_p1power.usagecurrent))>40)
+ 				bSend2Shared=true;
+ 			if (bSend2Shared)
+ 			{
+Index: b/hardware/TE923.cpp
+--- a/hardware/TE923.cpp
++++ b/hardware/TE923.cpp
+@@ -235,7 +235,7 @@
+ 		{
+ 			tsen.WIND.tempsign=(data.wChill>=0)?0:1;
+ 			tsen.WIND.chillsign=(data.wChill>=0)?0:1;
+-			int at10=round(abs(data.wChill*10.0f));
++			int at10=round(std::abs(data.wChill*10.0f));
+ 			tsen.WIND.temperatureh=(BYTE)(at10/256);
+ 			tsen.WIND.chillh=(BYTE)(at10/256);
+ 			at10-=(tsen.WIND.chillh*256);
+Index: b/hardware/Wunderground.cpp
+--- a/hardware/Wunderground.cpp
++++ b/hardware/Wunderground.cpp
+@@ -347,13 +347,13 @@
+ 		tsen.WIND.temperaturel=0;
+ 
+ 		tsen.WIND.tempsign=(wind_temp>=0)?0:1;
+-		int at10=round(abs(wind_temp*10.0f));
++		int at10=round(std::abs(wind_temp*10.0f));
+ 		tsen.WIND.temperatureh=(BYTE)(at10/256);
+ 		at10-=(tsen.WIND.temperatureh*256);
+ 		tsen.WIND.temperaturel=(BYTE)(at10);
+ 
+ 		tsen.WIND.chillsign=(wind_temp>=0)?0:1;
+-		at10=round(abs(wind_chill*10.0f));
++		at10=round(std::abs(wind_chill*10.0f));
+ 		tsen.WIND.chillh=(BYTE)(at10/256);
+ 		at10-=(tsen.WIND.chillh*256);
+ 		tsen.WIND.chilll=(BYTE)(at10);
+@@ -405,7 +405,7 @@
+ 						float rainrateph = static_cast<float>(atof(root["current_observation"]["precip_1hr_metric"].asString().c_str()));
+ 						if (rainrateph != -9999.00f)
+ 						{
+-							int at10 = round(abs(rainrateph*10.0f));
++							int at10 = round(std::abs(rainrateph*10.0f));
+ 							tsen.RAIN.rainrateh = (BYTE)(at10 / 256);
+ 							at10 -= (tsen.RAIN.rainrateh * 256);
+ 							tsen.RAIN.rainratel = (BYTE)(at10);
+Index: b/hardware/ZWaveBase.cpp
+--- a/hardware/ZWaveBase.cpp
++++ b/hardware/ZWaveBase.cpp
+@@ -641,7 +641,7 @@
+ 				return;
+ 			tsen.WIND.tempsign = (pTempDevice->floatValue >= 0) ? 0 : 1;
+ 			tsen.WIND.chillsign = (pTempDevice->floatValue >= 0) ? 0 : 1;
+-			int at10 = round(abs(pTempDevice->floatValue*10.0f));
++			int at10 = round(std::abs(pTempDevice->floatValue*10.0f));
+ 			tsen.WIND.temperatureh = (BYTE)(at10 / 256);
+ 			tsen.WIND.chillh = (BYTE)(at10 / 256);
+ 			at10 -= (tsen.WIND.chillh * 256);
+Index: b/main/mainworker.cpp
+--- a/main/mainworker.cpp
++++ b/main/mainworker.cpp
+@@ -9703,7 +9703,7 @@
+ 	tsen.TEMP.id2=1;
+ 
+ 	tsen.TEMP.tempsign=(temp1>=0)?0:1;
+-	int at10=round(abs(temp1*10.0f));
++	int at10=round(std::abs(temp1*10.0f));
+ 	tsen.TEMP.temperatureh=(BYTE)(at10/256);
+ 	at10-=(tsen.TEMP.temperatureh*256);
+ 	tsen.TEMP.temperaturel=(BYTE)(at10);
+@@ -9716,7 +9716,7 @@
+ 	tsen.TEMP.id2=2;
+ 
+ 	tsen.TEMP.tempsign=(temp2>=0)?0:1;
+-	at10=round(abs(temp2*10.0f));
++	at10=round(std::abs(temp2*10.0f));
+ 	tsen.TEMP.temperatureh=(BYTE)(at10/256);
+ 	at10-=(tsen.TEMP.temperatureh*256);
+ 	tsen.TEMP.temperaturel=(BYTE)(at10);
-- 
2.7.4
